# OSDb

Client library for the [OSDb protocol](http://trac.opensubtitles.org/projects/opensubtitles/wiki/XMLRPC).
Currently the implentation is limited to movie identification and subtitles search

## Examples

Just read the source of `bin/getsub` it is a typical example of OSDb's capacities.

## getsub

The osdb gem provide a simple script to find and download the best subtitle on
[opensubtitles.org](http://www.opensubtitles.org/) for your video file.

### Installation

First `getsub` need `curl` to works. Shiped by default on MacOS X but for a Debian like system:

    $ sudo aptitude install curl

Then install the gem:

    $ gem install osdb

### Usage

You just have to execute `getsub` with some video files in arguments:

    $ getsub somemovie.avi othermovie.mkv

For options details just run:

    $ getsub --help
