echo "Cai dat SVN Server: "
sudo apt-get update
sudo apt-get install -y \
  apache2 \
  subversion \
  libapache2-mod-svn \
  libsvn-dev
  
sudo a2enmod dav
sudo a2enmod dav_svn
sudo service apache2 restart

sudo cp dav_svn.conf /etc/apache2/mods-enabled/dav_svn.conf

sudo mkdir /var/lib/svn
sudo svnadmin create /var/lib/svn/repository
sudo chown -R www-data:www-data /var/lib/svn
sudo chmod -R 775 /var/lib/svn

echo "nhap mat khau: "
sudo htpasswd -cm /etc/apache2/dav_svn.passwd admin

if [ $? -eq 0 ] ; then
   sudo systemctl restart apache2.service
   echo "SVN cai dat o: /var/lib/svn"
   echo "truy cap vao duong dan 'http://localhost/svn/repository' de test svn server"
   echo "username: admin, pass nay moi nhap"
   echo "khi nao hien thi thong bao: 'repository - Revision 0: /' la Ok!"
else
   echo "Loi o dau do, t khong biet dau v:"
   exit 1
fi