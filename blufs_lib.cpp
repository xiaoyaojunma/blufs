/**
 * blufs - a c++ luafilesystem library
 * --------------------------------------------------------
 * Copyright (C) 2013, by Dmitry Ledentsov (d.ledentsov@gmail.com)
 *
 * This software is distributed under the MIT License. See notice at the end
 * of this file.
 *
 */

#include "blufs_lib.h"
#include <boost/filesystem.hpp>
#include <luabind/luabind.hpp>
#include <string>
#include <stdexcept>

namespace blufs {
	using namespace boost::filesystem;

	bool chdir(std::string const& p) {
		try {
			current_path(p);
		} catch (std::exception const& e) {
			std::cerr<<"blufs error: "<<e.what()<<std::endl;
			return false;
		}
		return true;
	}
}

void register_blufs (lua_State* L) {
	using namespace luabind;

	module(L, "blufs")
	[
		def("chdir",&blufs::chdir)
	];
}

/**
 * Copyright (c) 2013 Dmitry Ledentsov
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */
