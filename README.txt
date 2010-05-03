= MASHUP

A Padrino/Sinatra based application that displays RSS feeds from many sources on one page.

The RSS feeds are cached and only periodically updated and clicking on the article to read 
marks the article as read.

== REQUIREMENTS:

  * Ruby 1.8+
  * Ruby Gems
  * Sequel
  * Sinatra
  * Padrino

== INSTALL:

Project Hosts:
  * http://github.com/mwlang/mashup/tree/master

After cloning the project from git, run the following commands to get started:
  
  padrino rake sq:migrate:auto
  padrino rake seed
  padrino start

Then visit: http://localhost:3000

This should give you a page with a few RSS feeds to look at.

== FEATURES/PROBLEMS:

  * Articles that have been read are hidden.  
  * Articles are sorted in descending order of published date and time.
  * No web page for modifying the feeds, yet.  Modify the db/seeds.rb file for now.

== LICENSE:

(The MIT License)

Copyright (c) 2009 Michael Lang

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
