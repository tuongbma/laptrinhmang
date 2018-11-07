# laptrinhmang
Luồng chạy của mỗi request với url: laptrinhmang/mytask

- Tạo controller cho mytask: src/java/controller/MytaskController.java
- Vào web.xml map cho /mytask để trỏ đến MytaskController vừa tạo
- Khi request mới với URL trên, nó sẽ đi trực tiếp vào MytaskController. MytaskController kế thừa từ Controller, trong class Controller đã có biến kết nối đến database và 1 hàm check xem request đó do 1 user đã login thực hiên hay 1 thằng ngáo ngơ làm
- Controller lại kế thừa từ HttpServlet nên có thể override các hàm doGet, doPost,..
- Code:

+ Trong mỗi hàm doGet, doPost,.. lấy dữ liệu từ request gửi sang (nếu có) và xử lý gì đó
+ Muốn làm việc với database, thì sử dụng biến this.db, gọi đến hàm mình cần ở trong class utils/DBConnection, nếu chưa có hàm mong muốn thì vào class DBConnection tạo method mà mình muốn, hay tạo model mới trong model

+ Khi lấy đc data hay xử lý xong thì điều hướng: có 2 kiểu
    * Muốn hiển thị view cho Controller đó luôn thì dùng request.getRequestDispatcher().forward();, pass data bằng cách req.setAttribute(), chỉ dùng req.getSession().setAttribute() khi muốn lưu dữ liệu gì đó vào session (eg. user login), chỗ này có thể pass cả object
    * Khi muốn nhảy sang trang khác với đường dẫn /other, thì sử dụng resp.sendRedirect("other")

