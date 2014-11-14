#define CATCH_CONFIG_MAIN
#include <catch.hpp>

#include <LuaState.h>

#include <boost/filesystem.hpp>
#include <luabind/luabind.hpp>

using namespace boost::filesystem;

class LuaTest {
protected:
    lua::State state;
    path exec_path;
public:
    LuaTest() :
        exec_path(absolute(unique_path()))
    {
        add_lua_cpath();
        load_library_under_test();
        set_up_isolated_test_folder();
    }

    ~LuaTest() {
        clean_up_test_folder();
    }
public:
    void debug(std::string expression) {
        state.doString(std::string("print(") + expression + ")");
    }
private:
    void add_lua_cpath() {
        auto cpath =
            std::string("package.cpath=[[")
            + (current_path() / path("?.dll")).generic_string() + ";"
            + (current_path() / path("?.so")).generic_string() + ";"
            + "]] ..package.cpath";
        state.doString(cpath);
    }

    void load_library_under_test() {
        REQUIRE_NOTHROW(state.doString("require 'blufs'"));
    }

    void set_up_isolated_test_folder() {
        create_directories(exec_path);
        REQUIRE(exists(exec_path));
        current_path(exec_path);
    }

    void clean_up_test_folder() {
        try {
            current_path(exec_path.parent_path());
            remove_all(exec_path);
        }
        catch (std::exception& e) {
            std::cerr << e.what() << std::endl;
        }
    }
};

TEST_CASE_METHOD(LuaTest, "loading the library") {
    REQUIRE(state["blufs"].is<lua::Table>());
}

namespace {
    struct my_exception
    {};

    void throwing_function() {
        throw my_exception();
    }
}

TEST_CASE_METHOD(LuaTest, "throwing inside bound functions is allowed") {
    auto L = state.getState();
    luabind::module(L)
    [
        luabind::def("throwing_function", throwing_function)
    ];

    CHECK_THROWS_AS(state.doString("throwing_function()"), lua::RuntimeError);
}

TEST_CASE_METHOD(LuaTest, "changing and querying current directory") {
    std::string res = state["blufs"]["current_path"]();
    CHECK(res == current_path().generic_string());

    state.doString("blufs.current_path('..')");
    std::string parent_dir = state["blufs"]["current_path"]();
    CHECK(absolute(current_path()) == absolute(parent_dir));
    CHECK(absolute(current_path()) != absolute(res));
}

TEST_CASE_METHOD(LuaTest, "path construction and conversion") {
    SECTION("construct from string and path") {
        CHECK_NOTHROW(state.doString("blufs.path'.'"));
        CHECK_NOTHROW(state.doString("assert(blufs.path('.').generic_string == '.')"));
        CHECK_NOTHROW(state.doString("assert(blufs.path(blufs.path('.')).generic_string == '.')"));
    }

    SECTION("empty constructor") {
        CHECK_NOTHROW(state.doString("blufs.path()"));
        CHECK_NOTHROW(state.doString("assert(blufs.path().empty)"));
        CHECK_NOTHROW(state.doString("assert(not blufs.path('.').empty)"));
    }

    CHECK_NOTHROW(state.doString("assert(tostring(blufs.path('.')) == '\".\"')"));
}

TEST_CASE_METHOD(LuaTest, "concatenation and appends") {
    CHECK_NOTHROW(state.doString("assert((blufs.path('.')+blufs.path('a')).generic_string=='.a')"));
    CHECK_NOTHROW(state.doString("assert((blufs.path('.')/blufs.path('a')).generic_string=='./a')"));

    CHECK_NOTHROW(state.doString("assert((blufs.path('.')+'a').generic_string=='.a')"));
    CHECK_NOTHROW(state.doString("assert((blufs.path('.')/'a').generic_string=='./a')"));
    CHECK_NOTHROW(state.doString("assert((blufs.path('.')/'a'/'a').generic_string=='./a/a')"));
}

TEST_CASE_METHOD(LuaTest, "modifiers") {
    CHECK_NOTHROW(state.doString("local p=blufs.path('.'); p:clear(); assert(p.empty)"));
    CHECK_NOTHROW(state.doString("blufs.path('.'):make_preferred()"));

    CHECK_NOTHROW(state.doString("local p=blufs.path('a/b.c'); p:remove_filename(); assert(p.generic_string == 'a')"));
    CHECK_NOTHROW(state.doString("local p=blufs.path('a/b.c'); p:replace_extension('d'); assert(p.generic_string == 'a/b.d')"));
    CHECK_NOTHROW(state.doString("local p=blufs.path('a/b.c'); p:replace_extension('.d'); assert(p.generic_string == 'a/b.d')"));
}

TEST_CASE_METHOD(LuaTest, "comparison") {
    CHECK_NOTHROW(state.doString("assert(blufs.path('a'):compare(blufs.path('b'))==-1)"));
    CHECK_NOTHROW(state.doString("assert(blufs.path('a'):compare('b')==-1)"));
}

TEST_CASE_METHOD(LuaTest, "decomposition") {
    CHECK_NOTHROW(state.doString("assert(blufs.path('//net/foo').root_path.generic_string == '//net/')"));
    CHECK_NOTHROW(state.doString("assert(blufs.path('//net/foo').root_name.generic_string == '//net')"));
    CHECK_NOTHROW(state.doString("assert(blufs.path('//net/foo').root_directory.generic_string == '/')"));
    CHECK_NOTHROW(state.doString("assert(blufs.path('//net/foo').relative_path.generic_string == 'foo')"));
    CHECK_NOTHROW(state.doString("assert(blufs.path('//net/foo').parent_path.generic_string == '//net/')"));
    CHECK_NOTHROW(state.doString("assert(blufs.path('//net/foo').filename.generic_string == 'foo')"));
    CHECK_NOTHROW(state.doString("assert(blufs.path('/foo/bar.txt').stem.generic_string == 'bar')"));
    CHECK_NOTHROW(state.doString("assert(blufs.path('/foo/bar.txt').extension.generic_string == '.txt')"));
}

TEST_CASE_METHOD(LuaTest, "iteration") {
    CHECK_NOTHROW(state.doString("local n=0; for part in blufs.path('/foo/bar.txt').parts do n=n+1 end; assert(n==3)"));
}
