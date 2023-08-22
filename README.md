# A. Hướng dẫn cài svn server
1. Mở `cmd`:
   	```bash
   	sudo apt-get update
   	sudo apt-get install net-tools
   	ifconfig
   	```
<!-- kiểm tra dòng thứ 2, nếu inet bắt đầu 10. thì thực hiện bước 2, nếu không thì thực hiện bước 3 -->

2. Vào `setting`, `network` ở orancle VM. Tìm `attacked to` đổi từ `NAT` thành `bridged adapte`
=> khởi động lại máy ảo, sau đó mở cmd nhập `ifconfig` xem thay đổi hay chưa
3. Mở `cmd`:
   	```bash
   	sudo apt-get install -y git-core
   	cd install_svn
   	```
4. Tìm file `setupSVN.sh` đã clone về, chọn `properties`, chọn `permissions`, chọn `allow executing file as program`.
5. Mở `cmd`, thực hiện cài đặt:
   	```bash
   	sudo ./setup.sh
   	```
6. Sau khi thực hiện lệnh sudo trên, chờ cài đặt rồi làm theo hướng dẫn trong cmd là OK

# B. Tạo repository:
1. Tìm file dự án cần thêm, sau đó mở cmd
2. Tại `cmd`, gõ:
   	```bash
   	svn import . http://localhost/svn/repository/tenduan -m "tenduan"
   	```
- Sau đó, sẽ hiển thị yêu cầu nhập mật khẩu, tài khoản
3. Mở trình duyệt, tìm đường dẫn:
   	```bash
   	http://localhost/svn/repository/tenduan
   	```
- Hiển thị như này là ok:
![image](https://github.com/buck1704/install_svn/assets/132087690/ed064c92-f57b-4ed4-80f5-e4df040a4b3e)

# C. **Tắt tường lửa:**

1. **Mở cmd:**
   ```bash
   sudo apt-get update
   sudo apt-get install ufw
   ```
2. Tắt Tường Lửa:
   ```bash
   sudo ufw disable
   ```
4. Kiểm Tra Trạng Thái:
   ```bash
   sudo ufw status
   ```
   <!-- Nếu trạng thái hiện tại là "inactive", điều này có nghĩa là tường lửa đã được tắt. -->
5. Khởi Động Lại Máy:
   ```bash
   sudo reboot
   ```
# D. Tạo 1 Repository mới:
   ```bash
   sudo svnadmin create /var/svn/$REPOS
   sudo chown -R www-data:www-data /var/lib/svn
   sudo chmod -R 775 /var/lib/svn
   ```

# E. Tạo branch:
1. **Tạo đường dẫn tới svn:**
	```bash
	sudo mkdir -p /var/svn
	```
2. **Checkout để lấy repo về:**
	```bash
	sudo svn checkout https://localhost/svn/MyRepo MyRepo
	```
3. **Tạo 3 file trunk, branches, tags:**
   ```bash
    sudo svn mkdir file:///var/lib/svn/MyRepo/trunk -m"commit"
    ```
    ```bash
    sudo svn mkdir file:///var/lib/svn/MyRepo/branches -m"commit"
    ```
    ```bash
    sudo svn mkdir file:///var/lib/svn/MyRepo/tags -m"commit"
    ```
### Hoặc:
```bash
sudo svn mkdir file:///var/lib/svn/MyRepo/trunk -m"commit"
```
- tạo 1 file trong trunk, sau đó commit lên
- copy đưa vào branch

4. **Pull bài trên repository:**
```bash
sudo svn update
```
5. **Tạo file breakup:**
   ```bash
    sudo svn copy truck branches/buck
    ```
   ```bash
   sudo svn commit -m"add file breakup"	
	```
6. **Thử thêm file:**
   ```bash
   sudo touch test.txt
   ```
   ```bash
   sudo add test.txt
   ```
   ```bash
   sudo svn add test.txt
   ```
   ```bash
   sudo svn commit -m "add new file by braches"
   ```
8. **Cập nhật lên local:**
   ```bash
   sudo svn commit -m"[merge with buck]"	
   ```

 
# F. Install ssh:
### 1. Server:
   ```bash
   sudo apt update
   ```
   ```bash
   sudo apt install openssh-server
   ```
   ```bash
   sudo systemctl status ssh
   ```
   ```bash
   sudo ufw allow ssh
   ```
   ```bash
   ifconfig
   ```
### 2. Client:
   ```bash
   ssh usernameserver@ip
   ```
- `usernameserver`: tên máy ảo đang truy cập
- `ip`: địa chỉ ip

  
# G. Chu Kỳ Thực Hiện
1. **Cập nhật bản sao làm việc**: Sử dụng lệnh `svn update` để cập nhật bản sao với những thay đổi mới nhất từ kho lưu trữ.

2. **Thực hiện thay đổi**: Thay đổi các tập tin trong bản sao làm việc bằng các lệnh như `svn add`, `svn delete`, `svn copy`, và `svn move`.

3. **Xem lại thay đổi**: Sử dụng `svn status` và `svn diff` để xem lại những thay đổi đã thực hiện trên bản sao làm việc. 

4. **Sửa sai sót**: Nếu phát hiện sai sót, sử dụng lệnh `svn revert` để khôi phục tập tin hoặc thư mục về trạng thái chưa chỉnh sửa.

5. **Giải quyết xung đột**: Để tích hợp những thay đổi của repository main vào bản sao đang làm việc, sử dụng lệnh `svn update`. Nếu gặp xung đột, sử dụng `svn resolve` để giải quyết.

6. **Thêm sự thay đổi**: Sử dụng lệnh `svn commit` để phát hành thay đổi đến kho lưu trữ. 

# H. Một vài lệnh cơ bản:
### 1. `status:` phát hiện và báo cáo những thay đổi
#### Hiển thị mọi mục kể cả nó không thay đổi	
   ```bash
	svn status -v
   ```
#### Dự đoán xung đột:
   ```
	svn status -u
   ```
##### - `item ?`: chưa được đưa vào kiểm soát
##### - `item A`: được đưa vào vùng starg để commit
##### - `item C`: đang bị xung đột
##### - `item D`: tập tin đưa vào để xoá khỏi repository
##### - `item M`: nội dung trong file đã được sửa đổi

### 2. `add:` lên lịch thêm file vào repository
   ```bash
	svn add [target]
   ```
#### Thêm file mà không thêm nội dung bên trong:
   ```bash
	svn add --depth=empty [file.txt]
   ```
#### Thêm cả thư mục cha nếu nó chưa tồn tại:
   ```bash
   svn add --parents [folder/file.txt]
   ```
### 3. `delete:` xoá file, folder
   ```bash
	svn delete [target]
   ```
### 4. `copy:` sao chép file, folder
   ```bash
   svn copy [target] [target_copy]
   ```
### 5. `move:` di chuyển file, folder
   ```bash
   svn move [file] [file_copy]
   ```
### 6. `diff:` kiểm tra các thay đổi đã được thực hiện so với phiên bản trước đó hoặc 2 nhánh khác nhau
   ```bash
	svn diff [target]
   ```
##### - `target` là đường dẫn đến tập tin, thư mục hoặc URL muốn kiểm tra sự khác biệt. 
##### - Nếu không cung cấp `target`, lệnh sẽ so sánh sự khác biệt trong thư mục hiện tại so với phiên bản trước đó.
#### Ví dụ: xem file a.txt với phiên bản từ 5 -> 7:
   ```bash
	svn diff -r 5:7 [file.txt]
   ```
### 7. `revert:` sử dụng để hoàn tác các thay đổi bạn đã thực hiện trên tập tin.
   ```bash
	svn revert
   ```
#### Có thể dùng trong các trường hợp như hoàn tác lại thay đổi của 1 file, hoàn tác lại lệnh add hay delete.
#### Hoàn tác cả thư mục và nội dung bên trong của 1 folder:
   ```bash
   svn revert --depth=infinity [folder]
   ```
### 8. `log:` hiển thị thông tin về lịch sử thay đổi của mỗi phiên bản:
   ```bash
	svn log [file]
   ```
#### Thêm limit để hiển thị giới hạn số lượng:
   ```bash
   svn log --limit 5 file.txt
   ```
#### Ví dụ: xem file a.txt với phiên bản từ 5 -> 7:
   ```bash
	svn log -r 5:10 file.txt
   ```
### 9. `cat:` lấy về nội dung của một phiên bản cụ thể của tập tin và hiển thị trên màn hình:
   ```bash
	svn cat -r 10 file.txt
   ```
### 10. `annotate:` hiển thị nội dung của tập tin theo dạng bảng, kèm thông tin về số phiên bản và người thay đổi:
   ```bash
	svn annotate file.txt
   ```
### 11. `list:` Liệt kê tập tin trong một thư mục trên kho lưu trữ mà không cần tải về máy.
   ```bash
	svn list file.txt
   ```
### 12. `update:` đồng bộ hóa bản sao làm việc với phiên bản mới nhất của dự án.
   ```bash
	svn update
   ```
### 13. `merge:` 
##### Quay về nhánh trunk trước khi merge
   ```bash
   sudo svn merge [url_to_branch]
   ```
### 14. `cleanup:` tìm kiếm và hoàn tất các công việc còn lại sau khi có sự cố, ví dụ như máy tính tắt đột ngột. Nó cũng mở khóa bản sao làm việc nếu cần.
   ```bash
   svn cleanup
   ```










