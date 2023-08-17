# Hướng dẫn cài svn server
1. Mở `cmd`:
- sudo apt-get update
- sudo apt-get install net-tools
- ifconfig
<!-- kiểm tra dòng thứ 2, nếu inet bắt đầu 10. thì thực hiện bước 2, nếu không thì thực hiện bước 3 -->

2. Vào `setting`, `network` ở orancle VM. Tìm `attacked to` đổi từ `NAT` thành `bridged adapte`
=> khởi động lại máy ảo, sau đó mở cmd nhập `ifconfig` xem thay đổi hay chưa
3. Mở `cmd`:
- sudo apt-get install -y git-core
- cd install_svn
4. Tìm file `setupSVN.sh` đã clone về, chọn `properties`, chọn `permissions`, chọn `allow executing file as program`.
5. Mở `cmd`:
- sudo ./setup.sh
6. Sau khi thực hiện lệnh sudo trên, chờ cài đặt rồi làm theo hướng dẫn trong cmd là OK

# Tạo repository:
1. Tìm file dự án cần thêm, sau đó mở cmd
2. Tại `cmd`, gõ:
- svn import . http://localhost/svn/repository/`tenduan` -m "tenduan"
- sau đó sẽ hiển thị yêu cầu nhập mật khẩu, tài khoản
3. Mở trình duyệt, tìm đường dẫn:
- http://localhost/svn/repository/`tenduan`
- hiển thị như này là ok:
![image](https://github.com/buck1704/install_svn/assets/132087690/ed064c92-f57b-4ed4-80f5-e4df040a4b3e)
