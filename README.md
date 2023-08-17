# Huong dan cai svn server
1. Mo `cmd`:
- sudo apt-get update
- sudo apt-get install net-tools
- ifconfig
<!-- kiem tra dong thu 2, neu inet bat dau bang 10. thi thuc hien buoc 2, neu khong thi thuc hien buoc 3 -->

2. vao `setting`, `network` o orancle VM. cai dat `attacked to` thanh `bridged adapte`
=> khoi dong lai may ao va kiem tra `ifconfig` xem thay doi chua
3. mo `cmd`:
- sudo apt-get install -y git-core
- cd install_svn
4. tim file setupSVN.sh da cai dat, chon `properties`, chon `permissions`, chon `allow executing file as program`.
5. mo `cmd`:
- sudo ./setup.sh
6. thuc hien lenh sudo tren, lam theo huong dan tiep theo la OK