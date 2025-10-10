cd `dirname $0`

if test $1 = config; then
  ls -l conf.d
elif [ -z $2 ]; then 
  echo `cp $1/* ./conf.d`  
  echo `docker-compose restart`
else 
    if test -e $1/$2.conf ; then
        echo "$1/$2.conf cp into conf.d"
        echo `cp $1/$2.conf ./conf.d`
        echo "nginx docker-compose restart"
        echo `docker-compose restart`
    else
        echo "FileNotFoundException: $1/$2.conf is not exist";
    fi
fi