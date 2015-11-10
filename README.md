# centrpik

Theora and Vorbis Encoding guide:
ffmpeg -i input.avi -codec:v libtheora -qscale:v 7 -codec:a libvorbis -qscale:a 5 output.ogv
ffmpeg -i input.avi -f mp4 -vcodec mpeg4 -b 1500 -qmin 3 -qmax 5 -s 320x256 -b 384 output.m4v
параметры:
установить видео кодек:    -codec:v
установить аудио кодек:    -codec:a
-qscale[:stream_specifier] q (output,per-stream)
    Use fixed quality scale (VBR). 
    The meaning of q/qscale is codec-dependent. 
    If qscale is used without a stream_specifier 
    then it applies only to the video stream, 
    this is to maintain compatibility with previous 
    behavior and as specifying the same codec specific 
    value to 2 different codecs that is audio and video 
    generally is not what is intended when no stream_specifier is used. 
-f fmt (input/output)
    Force input or output file format. 
    The format is normally auto detected for input files 
    and guessed from the file extension for output files, 
    so this option is not needed in most cases.

получить информацию о видеофайле:
mplayer -vo null -ao null -identify -frames 0 /path/to/file
или
ffmpeg -i /path/to/file
или
exiftool /path/to/file
или
avprobe somefile.mp4

TO DO list:
