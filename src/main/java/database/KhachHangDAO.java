package database;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import model.KhachHang;

public class KhachHangDAO implements DAOInterface<KhachHang> {
	public ArrayList<KhachHang> data = new ArrayList();

	@Override
	public ArrayList<KhachHang> selectAll() {
		ArrayList<KhachHang> ketQua = new ArrayList<KhachHang>();
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.makeConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM khachhang";
			PreparedStatement st = con.prepareStatement(sql);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				String maKhacHang = rs.getString("makhachhang");
				String tenDangNhap = rs.getString("username");
				String matKhau = rs.getString("password");
				String hoVaTen = rs.getString("hovaten");
				String gioiTinh = rs.getString("gioitinh");
				String diaChi = rs.getString("diachi");
				String diaChiNhanHang = rs.getString("diachinhanhang");
				String diaChiMuaHang = rs.getString("diachinguoimua");
				Date ngaySinh = rs.getDate("ngaysinh");
				String soDienThoai = rs.getString("sdt");
				String email = rs.getString("email");
				boolean dangKyNhanBangTin = rs.getBoolean("dangkynhantin");

				KhachHang kh = new KhachHang(maKhacHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, diaChi,
						diaChiNhanHang, diaChiMuaHang, ngaySinh, soDienThoai, email, dangKyNhanBangTin);
				ketQua.add(kh);
			}

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public KhachHang selectById(KhachHang t) {
		KhachHang ketQua = null;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.makeConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM khachhang WHERE makhachhang=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaKhacHang());

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				String maKhacHang = rs.getString("makhachhang");
				String tenDangNhap = rs.getString("username");
				String matKhau = rs.getString("password");
				String hoVaTen = rs.getString("hovaten");
				String gioiTinh = rs.getString("gioitinh");
				String diaChi = rs.getString("diachi");
				String diaChiNhanHang = rs.getString("diachinhanhang");
				String diaChiMuaHang = rs.getString("diachinguoimua");
				Date ngaySinh = rs.getDate("ngaysinh");
				String soDienThoai = rs.getString("sdt");
				String email = rs.getString("email");
				boolean dangKyNhanBangTin = rs.getBoolean("dangkynhantin");

				ketQua = new KhachHang(maKhacHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, diaChi, diaChiNhanHang,
						diaChiMuaHang, ngaySinh, soDienThoai, email, dangKyNhanBangTin);
			}

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public int insert(KhachHang t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.makeConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "INSERT INTO khachhang (makhachhang, username, password, hovaten, gioitinh, diachi, diachinhanhang, diachinguoimua, ngaysinh, sdt, email, dangkynhantin) "
					+ " VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaKhacHang());
			st.setString(2, t.getTenDangNhap());
			st.setString(3, t.getMatKhau());
			st.setString(4, t.getHoVaTen());
			st.setString(5, t.getGioiTinh());
			st.setString(6, t.getDiaChi());
			st.setString(7, t.getDiaChiNhanHang());
			st.setString(8, t.getDiaChiMuaHang());
			st.setDate(9, (java.sql.Date) t.getNgaySinh());
			st.setString(10, t.getSoDienThoai());
			st.setString(11, t.getEmail());
			st.setBoolean(12, t.isDangKyNhanBangTin());

			// Bước 3: thực thi câu lệnh SQL
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public int insertAll(ArrayList<KhachHang> arr) {
		int dem = 0;
		for (KhachHang KhachHang : arr) {
			dem += this.insert(KhachHang);
		}
		return dem;
	}

	@Override
	public int delete(KhachHang t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.makeConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "DELETE from khachhang " + " WHERE makhachhang=?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getMaKhacHang());

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}

	@Override
	public int deleteAll(ArrayList<KhachHang> arr) {
		int dem = 0;
		for (KhachHang KhachHang : arr) {
			dem += this.delete(KhachHang);
		}
		return dem;
	}

	@Override
	public int update(KhachHang t) {
		int ketQua = 0;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.makeConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "UPDATE khachhang " + " SET " + " username=?" + ", password=?" + ", hovaten=?" + ", gioitinh=?"
					+ ", diachi=?" + ", diachinhanhang=?" + ", diachinguoimua=?" + ", ngaysinh=?" + ", sdt=?"
					+ ", email=?" + ", dangkynhantin=?" + " WHERE makhachhang=?";

			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getTenDangNhap());
			st.setString(2, t.getMatKhau());
			st.setString(3, t.getHoVaTen());
			st.setString(4, t.getGioiTinh());
			st.setString(5, t.getDiaChi());
			st.setString(6, t.getDiaChiNhanHang());
			st.setString(7, t.getDiaChiMuaHang());
			st.setDate(8, (java.sql.Date) t.getNgaySinh());
			st.setString(9, t.getSoDienThoai());
			st.setString(10, t.getEmail());
			st.setBoolean(11, t.isDangKyNhanBangTin());
			st.setString(12, t.getMaKhacHang());
			// Bước 3: thực thi câu lệnh SQL

			System.out.println(sql);
			ketQua = st.executeUpdate();

			// Bước 4:
			System.out.println("Bạn đã thực thi: " + sql);
			System.out.println("Có " + ketQua + " dòng bị thay đổi!");

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;

	}

	//add method
	public boolean checkUsername(String username) {
		boolean kq = false;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.makeConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM khachhang WHERE username=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, username);

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				kq= true;
			}

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return kq;
	}
	
	public KhachHang selectByUsernameAndPassword(KhachHang t) {
		KhachHang ketQua = null;
		try {
			// Bước 1: tạo kết nối đến CSDL
			Connection con = JDBCUtil.makeConnection();

			// Bước 2: tạo ra đối tượng statement
			String sql = "SELECT * FROM khachhang WHERE username=? AND password=?";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, t.getTenDangNhap());
			st.setNString(2, t.getMatKhau());

			// Bước 3: thực thi câu lệnh SQL
			System.out.println(sql);
			ResultSet rs = st.executeQuery();

			// Bước 4:
			while (rs.next()) {
				String maKhacHang = rs.getString("makhachhang");
				String tenDangNhap = rs.getString("username");
				String matKhau = rs.getString("password");
				String hoVaTen = rs.getString("hovaten");
				String gioiTinh = rs.getString("gioitinh");
				String diaChi = rs.getString("diachi");
				String diaChiNhanHang = rs.getString("diachinhanhang");
				String diaChiMuaHang = rs.getString("diachinguoimua");
				Date ngaySinh = rs.getDate("ngaysinh");
				String soDienThoai = rs.getString("sdt");
				String email = rs.getString("email");
				boolean dangKyNhanBangTin = rs.getBoolean("dangkynhantin");

				ketQua = new KhachHang(maKhacHang, tenDangNhap, matKhau, hoVaTen, gioiTinh, diaChi, diaChiNhanHang,
						diaChiMuaHang, ngaySinh, soDienThoai, email, dangKyNhanBangTin);
			}

			// Bước 5:
			JDBCUtil.closeConnection(con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return ketQua;
	}
}
