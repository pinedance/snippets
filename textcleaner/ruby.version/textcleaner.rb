# user imagemagic and textcleaner script
# http://www.fmwconcepts.com/imagemagick/textcleaner/index.php

imgsNs = Dir["./img/**/*.jpg"].sort

imgsNs.each do | imgnm |

    newpath = File.dirname(imgnm).sub("/img/", "/imgr/")
    newimgnm = imgnm.sub("/img/", "/imgr/")
    
    next if File.exist?(newimgnm)
    Dir.mkdir( newpath ) if !Dir.exist?(newpath)

    cmdmain = "./textcleaner -g -e stretch -f 25 -o 5 -s 1"

    cmd = "#{cmdmain} #{imgnm} #{newimgnm}"
    puts cmd
    system(cmd)
end
