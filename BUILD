Todo:
https://wiki.libav.org/Encoding/h264
losseless: -qp 0
avconv -r 30 -i work/glassCam0.9/glassCam0.9-F9081-1.778-%03d.png -aspect 1.778 -b 9000000 -y output/coco.mpg

---2015-03-16: Docker Notes
$(/usr/local/bin/boot2docker shellinit)
docker build -t daneroo/bucky-moire ./
docker run --name bucky-moire --rm -i -v `pwd`/output:/buckyMoire/output -t daneroo/bucky-moire bash
docker exec -it bucky-moire bash

  # start the generic docker image
  docker run --name ubuntu_bash --rm -i -t ubuntu bash
  # to get a second shell
  docker exec -it ubuntu_bash bash

  #once inside:
  apt-get update
  apt-get -y install rsync ssh build-essential bc libav-tools
  mkdir /buckyMoire
  rsync -av --progress daniel@192.168.3.111:Code/iMetrical/buckyMoire/ /buckyMoire/

Dome: 
http://www.antiprism.com/other/dome/
https://github.com/antiprism/dome-4.80ar
#wget http://www.antiprism.com/other/dome/dome-4.80ar.02.tar.gz
tar xzvf distr/dome-4.80ar.02.tar.gz
cd dome-4.80ar.02
./configure
make
make install

ffmpeg:
apt-get install libav-tools

povray: (old)
tar xjvf distr/povray-3.6-bin.tar.bz2

---End of docker notes

This is how to reproduce all the renders.

  svn checkout https://snookr.googlecode.com/svn/trunk/buckyMoire buckyMoire --username daniel.lauzon

Extract Binaries:
  Commited the sources and built-binaries, into svn.
  distr/
   +povray
   +dome
   +ffmpeg:  **the latest rpmforge release behaves differently for -b <bitrate>
        new: -b 9000000, old (which I use): -b 9000 (i.e. in kb/s vs b/s)
          so be careful if you switch, not sure where I got the sources.

  cd buckyMoire
  tar xjvf distr/dome_4_80-bin.tar.bz2
  tar xjvf distr/ffmpeg-bin.tar.bz2
  tar xjvf distr/povray-3.6-bin.tar.bz2

Rendering:
  All script are meant to be run with cwd  = buckyMoire (top dir)

first doMesh:
   for both aspect ratios, 1.778, 1.333 (16:9 and 4:3)
   creates {24 27 30 33 36 39 42 45 48}^2 combinations of 
   inner/outer dome frequency renders:
   every iteration createss a work directory and the resulting
   render is put into output/mesh-1.xxx

euler: doMesh - 122747.134s
./doMesh 
# mv output to renders, if you  wish to keep !
mkdir -p renders
mv output/mesh-1.778 renders
mv output/mesh-1.333 renders


now for the storyBoard...

euler:  79295.812s
cantor: 88329.171s
./doStory.sh
  mv output/story-1.778 renders
  mv output/story-1.333 renders

And finally the annotated final sequences

./doAnnotate.sh : depends on renders/mesh-XXX/, and renders/story-XXX/

  mkdir renders/annotate-final-1.778
  mv output/meshF*-1.778.mpg renders/annotate-final-1.778
  mv output/story-1.778.mpg renders/annotate-final-1.778

  mkdir renders/annotate-final-1.333
  mv output/meshF*-1.333.mpg renders/annotate-final-1.333
  mv output/story-1.333.mpg renders/annotate-final-1.333
