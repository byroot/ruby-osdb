# OSDb

Client library for the [OSDb protocol](http://trac.opensubtitles.org/projects/opensubtitles/wiki/XMLRPC).
Currently the implentation is limited to movie identification and subtitles search

[![Build Status](https://secure.travis-ci.org/byroot/ruby-osdb.png)](http://travis-ci.org/byroot/ruby-osdb)
[![Gem Version](https://badge.fury.io/rb/osdb.png)](http://badge.fury.io/rb/osdb)

## Examples

Just read the source of `bin/getsub` it is a typical example of OSDb's capacities.

## getsub

The osdb gem provide a simple script to find and download the best subtitle on
[opensubtitles.org](http://www.opensubtitles.org/) for your video file.

### Installation

    $ gem install osdb

### Usage

You just have to execute `getsub` with some video files in arguments:

    $ getsub somemovie.avi othermovie.mkv

Or specify a directory to search recursively:

    $ getsub ~/Movies

For options details just run:

    $ getsub --help
