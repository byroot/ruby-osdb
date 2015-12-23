# OSDb

Client library for the [OSDb protocol](http://trac.opensubtitles.org/projects/opensubtitles/wiki/XMLRPC).
Currently the implentation is limited to movie identification and subtitles search

[![Build Status](https://secure.travis-ci.org/evandrojr/ruby-osdb.png)](http://travis-ci.org/byroot/ruby-osdb)
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
    
    
    Automatically download subs for your video files using opensubtitle.org

Usage: getsub [options] DIRECTORY | VIDEO_FILE [VIDEO_FILE ...]

Main options:
    -a, --auto                       Do not ask user to resolve hash conflicts.
    -l, --language LANGUAGE          Sub language ISO 639-2 code like fre or eng. Default: env $LANG (pob)
    -f, --force                      Download sub even if video already has one
    -t, --type FORMATS               Select only subtitles in specified formats. e.g -t srt,sub
    -L, --language-extension         Add the ISO 639-2 in the subtitle's file extension. e.g filename.eng.srt
    -s, --search-by METHODS          Ordered list of search methods. h: by movie hash, i: by name on IMDB, n: by name on OSDb, p: by filename on OSDb. e.g -s hi . Default: h

