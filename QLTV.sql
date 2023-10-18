create database QLSACHTTHUVIEN 
use QLSACHTTHUVIEN 
go 

create table TacGia 
(
MaTacGia char(20) primary key , 
TenTacGia nvarChar(20) not null , 
website char(20) , 
ghichu text , 

) 
create table TheLoai
(
MaTheLoai char(20) primary key  , 
TenTheLoai nvarchar(20) not null , 

)
create table NhaXuatBan
(
MaNXB char(20) primary key , 
TenNXB char(20) not null, 
DiaChi nvarchar(30) not null , 
Email char(20) not null , 
TTNguoiDD nvarchar(20) , 

) 

create table Sach 
(
MaSach char(20) primary key , 
TenSach nvarchar(20) not null , 
MaTacGia char(20) not null , 
MaTheLoai char(20) not null , 
MaNXB char(20) not null , 
NamXuatBan int , 
foreign key (MaTacGia) references TacGia(MaTacGia) ,
foreign key (MaTheLoai) references TheLoai(MaTheLoai) ,
foreign key (MaNXB) references NhaXuatBan(MaNXB) 
)

create table TheThuVien 
(
SoThe char(20) primary key , 
NgayBatDau date not null , 
NgayHetHan date not null, 
ghichuThe text ,
check (NgayBatDau < NgayHetHan)
) 

create table DocGia 
(
MaDocGia char(20) primary key , 
TenDocGia char(20) not null , 
DiaChiDG nvarchar(20) , 
SoThe char(20)  ,
foreign key (SoThe) references TheThuVien(SoThe)
) 

create table NhanVien
(
MaNhanVien char(20) primary key , 
HoTen nvarchar(20) , 
NgaySinh date not null , 
SoDienThoai nchar(20) not null ) 
create table MuonTra 
(
MaMuonTra char(20) , 
SoThe char(20) not null , 
ManhanVien char(20) not null , 
NgayMuon date not null , 
primary key (MaMuonTra) , 
foreign key (ManhanVien) references NhanVien(ManhanVien) , 
foreign key (SoThe ) references TheThuVien(SoThe) 
) 


create table CTMuontra 
(
MaMuonTra char(20) , 
MaSach char(20) , 
GhiChuCT text  , 
DaTra int  , 
NgayTra date ,
primary key ( MaMuonTra ,MaSach), 
foreign key (MaSach) references Sach ( MaSach) , 
foreign key (MaMuonTra) references MuonTra (MaMuonTra) ) 


insert into TacGia values ( 'TG01' , N'Trần văn Ân' , 'TacGiaTruyen' , 'Sach con moi' ) , 
                          ( 'TG02' , N'Trần hùng Thái' , 'TacGiasach' , 'new' ) , 
						  ( 'TG03' , N'Văn Phi' , 'Giáo dục' , N'moi phat hanh' ) , 
						  ( 'TG04' , N'Văn Cao' , 'NhaTho' , N'am nhac quoc ca' ) , 
						  ( 'TG05' , N'Nguyên Linh' , 'GiaoDuc' , null )  
insert into TheLoai values ('TL01' , N'Truyện tranh' ) , 
                           ('TL02' , N'Truyện Cười' ) , 
						   ('TL03' , N'Giáo dục' ) , 
						   ('TL04' , N'Khám phá' ) , 
						   ('TL05' , N'vật lý' ) 
insert into NhaXuatBan values ('NXB01' , 'Giáo Dục' , 'Hà Nội', 'XBGD@gmail.com' , null ) , 
                              ('NXB02' , 'Đóa Hoa' , 'Ba Vì', 'TruyeMa@gmail.com' , 'Anh' ) ,
							  ('NXB03' , 'Giáo Dục' , 'Hà Nội', 'XBGD@gmail.com' , null ) , 
							  ('NXB04' , 'Thiên Ân' , 'Đà Nẵng', 'BiAn@gmail.com' , 'Hoàng' ) , 
							  ('NXB05' , 'Mai Toàn' , 'Hải phòng', 'KhamPha@gmail.com' , 'Thành' )  
insert into Sach values ('MS01' , 'Cẩm nang VLy' ,    'TG01' ,  'TL01' , 'NXB01' , 2001 ) , 
                        ('MS02' , 'Cẩm nang Toán' ,    'TG04' , 'TL03' , 'NXB04' , 2005 ) ,
						('MS03' , 'Khám phá' ,        'TG02' ,  'TL02' , 'NXB02' , 2021 ) ,
						('MS04' , 'đi tìm chìa khóa' , 'TG05' , 'TL04' , 'NXB05' , 2019 ) ,
						('MS05' , 'Cẩm nang Anh' ,    'TG03' ,  'TL02' , 'NXB03' , 2018 ) ,
						('MS06' , 'Cẩm nang VLy' ,    'TG01' ,  'TL05' , 'NXB04' , 2001 ) 
insert into TheThuVien values ('ST01' , '2021/7/12' , '2021/8/20' , 'tra dung ngay' ) , 
                              ('ST02' , '2021/5/20' , '2021/5/28' , 'tra dung ngay' ) ,
							  ('ST03' , '2021/8/8' , '2021/9/8'   , 'tra dung ngay' ) , 
							  ('ST04' , '2021/3/21' , '2021/6/21' , 'tra dung ngay' ) , 
							  ('ST05' , '2021/2/28' , '2021/8/28' , 'tra dung ngay' )  
insert into DocGia values ('DG001' , 'Trần Anh' , N'Ninh bình' , 'ST02' ) , 
                          ('DG002' , 'Trần Vân' , N'Hải Phòng' , 'ST02' ) , 
						  ('DG003' , 'Hoàng Long' , N'Ba vì' , 'ST02' ) , 
						  ('DG004' , 'Hùng Nguyễn' , N'Hà Nội' , 'ST02' ) , 
						  ('DG005' , 'Văn Mai' , N'Hải Phòng' , 'ST02' )  

insert into NhanVien values ('NV01' , 'Mai Toàn' , '2001/12/14' , '056845659' ) , 
                            ('NV02' , 'Vũ Hoàn' , '2000/1/29' , '3243254645' ) , 
							('NV03' , 'Mai Anh' , '2002/7/19' , '53454756876' ) , 
							('NV04' , 'Mỹ Linh' , '2001/8/9' , '344365476' ) , 
							('NV05' , 'Lê Hằng' , '2003/8/16' , '457547546' ) , 
							('NV06' , 'Thanh Hằng' ,'2004/10/9' , '456746735' ) 
							
insert into MuonTra values ('MuonTra001' , 'ST02' , 'NV02' , '2021/6/15' ) , 
                           ('MuonTra002' , 'ST01' , 'NV04' , '2021/5/20' ) , 
						   ('MuonTra003' , 'ST04' , 'NV05' , '2021/4/25' ) , 
						   ('MuonTra004' , 'ST05' , 'NV02' , '2021/7/12' ) , 
						   ('MuonTra005' , 'ST03' , 'NV01' , '2021/8/14' ) , 
						   ('MuonTra006' , 'ST04' , 'NV03' , '2021/12/5' ) , 
						   ('MuonTra007' , 'ST03' , 'NV06' , '2021/12/4' )  
insert into CTMuontra values ('MuonTra002' , 'MS02' ,'tra dung hen' , null , null ) , 
                             ('MuonTra005' , 'MS03'  ,'hen truoc'  , 1 , '2021/9/20' ) , 
							 ('MuonTra002' , 'MS01' ,'giu sach se'  , null , null ) , 
							 ('MuonTra006' , 'MS05' ,'hen gap lai' , null , null ) , 
							 ('MuonTra001' , 'MS04'  ,null , 1 ,  '2021/6/20' ) , 
							 ('MuonTra003' , 'MS01'  ,null , null  , null ) , 
							 ('MuonTra006' , 'MS04' ,null , 1 ,  '2021/12/9' ) , 
							 ('MuonTra007' , 'MS03' ,null , null , null )  
						   
						   
select *from Sach 
select *from DocGia 
select *from TacGia
select *from TheLoai
select *from NhaXuatBan
select *from TheThuVien
select *from NhanVien
select *from MuonTra
select *from CTMuontra


