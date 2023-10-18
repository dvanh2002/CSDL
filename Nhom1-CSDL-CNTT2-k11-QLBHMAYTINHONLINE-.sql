CREATE DATABASE QLBH
use QLBH
-- tao bang khach hang
CREATE TABLE KHACHHANG(
	MAKH	char(4) not null,	
	HOTEN	varchar(40),
	DCHI	varchar(50),
	SODT	varchar(20),
	NGSINH	smalldatetime,
	NGDK	smalldatetime,
	DOANHSO	money 
	constraint pk_kh primary key(MAKH)
)

alter table KHACHHANG  ALTER COLUMN DOANHSO MONEY  
-- tao bang nhan vien 
CREATE TABLE NHANVIEN(
	MANV	char(4) not null,	
	HOTEN	varchar(40),
	SODT	varchar(20),
	NGVL	smalldatetime	
	constraint pk_nv primary key(MANV)
)
-- tao bang san pham 
CREATE TABLE SANPHAM(
	MASP	char(4) not null,
	TENSP	nvarchar(255),
	DVT	varchar(20),
	NUOCSX	varchar(40),
	GIA	money,
	constraint pk_sp primary key(MASP)	
)



-- tao bang hoa don
CREATE TABLE HOADON(
	SOHD	int not null,
	NGHD 	smalldatetime,
	MAKH 	char(4),
	MANV 	char(4),
	TRIGIA	money,
	constraint pk_hd primary key(SOHD)
)
-- tao bang CTHD
 CREATE TABLE CTHD(
	SOHD	int,
	MASP	char(4),
	SL	int,
	constraint pk_cthd primary key(SOHD,MASP)
)
-- Check
alter table SANPHAM ADD CONSTRAINT check_giasv CHECK(GIA>1000000)
-- Khoa ngoai cho bang HOADON
ALTER TABLE HOADON ADD CONSTRAINT fk01_HD FOREIGN KEY(MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE HOADON ADD CONSTRAINT fk02_HD FOREIGN KEY(MANV) REFERENCES NHANVIEN(MANV)
-- Khoa ngoai cho bang CTHD
ALTER TABLE CTHD ADD CONSTRAINT fk01_CTHD FOREIGN KEY(SOHD) REFERENCES HOADON(SOHD)
ALTER TABLE CTHD ADD CONSTRAINT fk02_CTHD FOREIGN KEY(MASP) REFERENCES SANPHAM(MASP)

-- them khach hang
insert into khachhang values('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','8823451','22/10/1960','22/07/2006',13060000)
insert into khachhang values('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','908256478','03/04/1974','30/07/2006',280000)
insert into khachhang values('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','938776266','12/06/1980','08/05/2006',3860000)
insert into khachhang values('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','917325476','09/03/1965','10/02/2006',250000)
insert into khachhang values('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','8246108','10/03/1950','28/10/2006',21000)
insert into khachhang values('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','8631738','31/12/1981','24/11/2006',915000)
insert into khachhang values('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','916783565','06/04/1971','12/01/2006',12500)
insert into khachhang values('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','938435756','10/01/1971','13/12/2006',365000)
insert into khachhang values('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','8654763','03/09/1979','14/01/2007',70000)
insert into khachhang values('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','8768904','02/05/1983','16/01/2007',67500)

select * from KHACHHANG


--- them nhan vien 

insert into nhanvien values('NV01','Nguyen Nhu Nhut','927345678','13/04/2006')
insert into nhanvien values('NV02','Le Thi Phi Yen','987567390','21/04/2006')
insert into nhanvien values('NV03','Nguyen Van B','997047382','27/04/2006')
insert into nhanvien values('NV04','Ngo Thanh Tuan','913758498','24/06/2006')
insert into nhanvien values('NV05','Nguyen Thi Truc Thanh','918590387','20/07/2006')

-- them san pham
        insert into sanpham values('MT02','Lenovo IdeaPad Slim 5 15ITL05 (82FG001PVN)','Lenovo','Singapore',12000000)
        insert into sanpham values('MT03','Lenovo IdeaPad 3 15ITL6 i5 1135G7 (82H80042VN)','Lenovo','Viet Nam',8000000)
        insert into sanpham values('MT04','HP Pavilion 15 eg0505TU i5 1135G7 (46M02PA)','HP','Viet Nam',24000000)
        insert into sanpham values('MT05','Dell Gaming G3 15 i7 10750H (P89F002BWH)','DELL','Viet Nam',12900000)
        insert into sanpham values('MT06','Asus TUF Gaming FX506LH i5 10300H (HN002T)','Asus','Trung Quoc',27000000)
        insert into sanpham values('MT07','Acer Aspire A315 56 308N i3 1005G1 (NX.HS5SV.00C)','Acer','Trung Quoc',15000000)
        insert into sanpham values('MT08','MSI Katana Gaming GF66 11UC i7 11800H (224VN)','MSI','Trung Quoc',15000000)
        insert into sanpham values('MT09','LG Gram 16 2021 i7 1165G7 (16Z90P-G.AH73A5)','LG','Trung Quoc',18000000)

		SELECT * FROM sanpham
		-- them hoa don
		insert into hoadon values(1001,'23/07/2006','KH01','NV01',32000000)
insert into hoadon values(1002,'12/08/2006','KH01','NV02',84000000)
insert into hoadon values(1003,'23/08/2006','KH02','NV01',10000000)
insert into hoadon values(1004,'01/09/2006','KH02','NV01',18000000)
insert into hoadon values(1005,'20/10/2006','KH01','NV02',380000000)
insert into hoadon values(1006,'16/10/2006','KH01','NV03',243000000)
insert into hoadon values(1007,'28/10/2006','KH03','NV03',51000000)
insert into hoadon values(1008,'28/10/2006','KH01','NV03',44000000)
insert into hoadon values(1009,'28/10/2006','KH03','NV04',20000000)
insert into hoadon values(1010,'01/11/2006','KH01','NV01',52000000)
insert into hoadon values(1011,'04/11/2006','KH04','NV03',25000000)
insert into hoadon values(1012,'30/11/2006','KH05','NV03',21000000)
insert into hoadon values(1013,'12/12/2006','KH06','NV01',50000000)
insert into hoadon values(1014,'31/12/2006','KH03','NV02',315000000)
insert into hoadon values(1015,'01/01/2007','KH06','NV01',9100000)
insert into hoadon values(1016,'01/01/2007','KH07','NV02',120000500)
insert into hoadon values(1017,'02/01/2007','KH08','NV03',350000000)
insert into hoadon values(1018,'13/01/2007','KH08','NV03',330000000)
insert into hoadon values(1019,'13/01/2007','KH01','NV03',300000000)
insert into hoadon values(1020,'14/01/2007','KH09','NV04',7000000)
insert into hoadon values(1021,'16/01/2007','KH10','NV03',67500000)
insert into hoadon values(1022,'16/01/2007',Null,'NV03',700000000)
insert into hoadon values(1023,'17/01/2007',Null,'NV01',330000000)
Select * from hoadon

-- them CTHD 
insert into cthd values(1001,'MT02',10)
insert into cthd values(1001,'MT01',5)
insert into cthd values(1001,'MT01',5)
insert into cthd values(1001,'MT02',10)
insert into cthd values(1001,'MT08',10)
insert into cthd values(1002,'MT04',20)
insert into cthd values(1002,'MT01',20)
insert into cthd values(1002,'MT02',20)
insert into cthd values(1003,'MT03',10)
insert into cthd values(1004,'MT01',20)
insert into cthd values(1004,'MT02',10)
insert into cthd values(1004,'MT03',10)
insert into cthd values(1004,'MT04',10)
insert into cthd values(1005,'MT05',50)
insert into cthd values(1005,'MT06',50)
insert into cthd values(1006,'MT07',20)
insert into cthd values(1006,'MT01',30)
insert into cthd values(1006,'MT02',10)
insert into cthd values(1007,'MT03',10)
insert into cthd values(1008,'MT04',8)
insert into cthd values(1009,'MT05',10)
insert into cthd values(1010,'MT07',50)
insert into cthd values(1010,'MT07',50)
insert into cthd values(1010,'MT08',100)
insert into cthd values(1010,'MT04',50)
insert into cthd values(1010,'MT03',100)
insert into cthd values(1011,'MT06',50)
insert into cthd values(1012,'MT07',3)
insert into cthd values(1013,'MT08',5)
insert into cthd values(1014,'MT02',80)
insert into cthd values(1014,'MT02',100)
insert into cthd values(1014,'MT04',60)
insert into cthd values(1015,'MT02',30)

SELECT * FROM CTHD
--1.	In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC'
--2.	In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “MT” và kết thúc là “02”.
SELECT MASP, TENSP
FROM SANPHAM
WHERE MASP LIKE 'MT%02'
---3. In ra các số hóa đơn, trị giá hóa đơn trong tháng 1/2007, sắp xếp theo ngày (tăng dần) và trị giá của hóa đơn (giảm dần).
SELECT SOHD, TRIGIA
FROM HOADON
WHERE MONTH(NGHD) = 1 AND YEAR(NGHD) = 2007
ORDER BY NGHD ASC, TRIGIA DESC
--4.In ra danh sách các khách hàng (MAKH, HOTEN) đã mua hàng trong ngày 1/1/2007.
SELECT K.MAKH, HOTEN
FROM KHACHHANG K INNER JOIN HOADON H
ON K.MAKH = H.MAKH
WHERE NGHD = '1/1/2007'

----5.	In ra danh sách các sản phẩm (MASP,TENSP) được khách hàng có tên “Nguyen Van A” mua trong tháng 10/2006.
SELECT DISTINCT S.MASP, TENSP
FROM SANPHAM S INNER JOIN CTHD C
ON S.MASP = C.MASP
AND EXISTS(SELECT *
FROM CTHD C INNER JOIN HOADON H
ON C.SOHD = H.SOHD
AND MONTH(NGHD) = 10 AND YEAR(NGHD) = 2006 AND MAKH IN(SELECT H.MAKH
FROM HOADON H INNER JOIN KHACHHANG K
ON H.MAKH = K.MAKH
WHERE HOTEN = 'NGUYEN VAN A') AND S.MASP = C.MASP)
--6--.	In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT MASP, TENSP
FROM SANPHAM
WHERE NUOCSX = 'TRUNG QUOC' AND GIA IN (SELECT DISTINCT TOP 3 GIA
FROM SANPHAM
ORDER BY GIA DESC)
--7.	Tính tổng số sản phẩm của từng nước sản xuất.
SELECT NUOCSX, COUNT(DISTINCT MASP) AS TONGSOSANPHAM
FROM SANPHAM
GROUP BY NUOCSX
--8  Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
SELECT NUOCSX, MAX(GIA) AS MAX
FROM SANPHAM
GROUP BY NUOCSX

----

SELECT B.NUOCSX, MASP, TENSP
FROM (SELECT NUOCSX, MAX(GIA) AS MAX
FROM SANPHAM
GROUP BY NUOCSX) AS B LEFT JOIN SANPHAM S 
ON S.GIA = B.MAX 
WHERE B.NUOCSX = S.NUOCSX

--9. cap nhat san pham  theo  MASP
SELECT * FROM sanpham
UPDATE SANPHAM SET tensp='Lenovo Ideapad 5 15ITL05 i5 1135G7 (82FG00P5VN)'
 WHERE MASP='MT02'
 --10 Xoa san poham co MT "09"

DELETE FROM SANPHAM WHERE MASP ='MT09'
select * FROM SANPHAM

--11.	Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.
SELECT H.SOHD 
FROM HOADON H
WHERE YEAR(NGHD) = 2006 AND NOT EXISTS(SELECT *
FROM SANPHAM S
WHERE NUOCSX = 'SINGAPORE'
AND NOT EXISTS(SELECT * 
FROM CTHD C
WHERE C.SOHD = H.SOHD
AND C.MASP = S.MASP))

--12.	In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
SELECT S.MASP, TENSP
FROM SANPHAM S
WHERE S.MASP NOT IN(SELECT C.MASP 
FROM CTHD C RIGHT JOIN HOADON H
ON C.SOHD = H.SOHD
WHERE YEAR(NGHD) = 2006)