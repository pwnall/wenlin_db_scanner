# Wenlin Reverse Engineering Log

I documented my reverse engineering efforts, so that I wouldn't have to keep
everything in my head. My notes are shared here, in the hope that they will be
helpful to others attempting similar things.

## Inventory

The files in this directory are as follows.

* `notes.txt` - describes the .db file format
* `magic.txt` - the magic constants used to decode .db record data
* `code.asm` - annotated disassembly of the .db record extracting procedures

## Method

I used the Mac build of Wenlin Dictionary, version 4.02. It should be fairly
easy to obtain.

The code was disassembled with the evaluation version of
[IDA Pro](http://www.hex-rays.com/products/ida/), which can be downloaded for
free. I made extensive use of the graph view, and of the variable naming
feature.

Fairly late (too late) in the process, I also used
[Affinic Debugger GUI](http://www.affinic.com/?page_id=109), which is a `gdb`
front-end. It can also be downloaded for free. I would have preferred to use
IDA's debugging features, but I couldn't figure out how to set a gdb server
on OSX 10.8 fast enough. I used the live debugger to prove or disprove the
hypotheses produced by the disassembly.

I also used the [Hex Fiend](http://ridiculousfish.com/hexfiend/) OSX hex editor
to take a look at the .db files.

At the end of the process, I learned about
[iosnoop](http://www.brendangregg.com/DTrace/iosnoop_example.html), which is
a DTrace script that traces filesystem operations. It is built into OSX, and it
might have been very useful, had I known about it.
