if [ $# -ne 1 ]
then
    echo "usage: ./post-install.sh <installation-dir-full-path>"
    exit 0;
fi

cp ReleaseNotes.md INSTALL.kunlun.md README.md README_CN.md  $1
mkdir -p $1/scripts
cd scripts/
cp add_comp_nodes.py  add_shards.py  bootstrap.py  common.py comp-nodes.json  install_pg.py start_pg.py shards-config.json create_cluster.py  meta_inuse.sql  meta-shard.json $1/scripts
cp -r ../resources $1
cp ../resources/libmariadb.so.3 $1/lib
cd $1/lib
ln -s ./libmariadb.so.3  libmysqlclient.so
ln -s ./libmariadb.so.3  libmariadb.so

mkdir -p deps

#copy dependent shared object libs to lib/deps
cd $1/bin
ls | grep -v 'prog-deps.txt' | xargs ldd >> ./prog-deps.txt 2>/dev/null
cat ./prog-deps.txt | sed -n '/^.* => .*$/p' | sed  's/^.* => \(.*\)(.*$/\1/g' | sort | uniq | sed /^.*postgresql-11\.5.*$/d | while read f ; do  cp $f $1/lib/deps ; done
rm ./prog-deps.txt

