.model small
.code
org 100h
start:
	jmp mulai
nama 	db 13,10,'Nama customer : $'
nomor	db 13,10,'Nomor HP : $'

tampung_nama	db 30,?,30 dup(?)
tampung_nomor	db 13,?,13 dup(?)


a db 1
b db 2
c db 3
d db 4
e db 5
f dw 6

daftar db 13,10,'--------------------------------------------------------|'
       db 13,10,'|                 WARNET ANTI CEPU                      |'
       db 13,10,'|-------------------------------------------------------|'
       db 13,10,'+---+-------------------------+-------------------------+'
       db 13,10,'|No |       jenis-jenis       |          harga          |'
       db 13,10,'+---+-------------------------+-------------------------+'
       db 13,10,'| 1 |        Reguler          |  Rp 5.000/jam           |'
       db 13,10,'+---+-------------------------+-------------------------+'
       db 13,10,'| 2 |          VIP            |  Rp 10.000/jam          |'
       db 13,10,'+---+-------------------------+-------------------------+'
       db 13,10,'| 3 |     Paket Begadang      |  Rp 60.000/malam        |'
       db 13,10,'+---+-------------------------+-------------------------+'
       db 13,10,'| 4 |  Paket begadang (VIP)   |  Rp 80.000/hari         |'
       db 13,10,'+---+-------------------------+-------------------------+'
       db 13,10,'| 5 |      Paket Hemat        |  Rp 30.000/3jam         |'
       db 13,10,'+---+-------------------------+-------------------------+'
       db 13,10,'| 6 |     Paket Pelajar       |  Rp 20.000/3jam         |'
       db 13,10,'+---+-------------------------+-------------------------+','$'

           
error 	    db 13,10,'Pilihan tidak tersedia di menu $'
pilih_ntr 	db 13,10,'Silahkan pilih jenis pesanan : $'
success 	db 13,10,'pesanan  sedang di proses $'


mulai:
	mov ah,09h	
	lea dx,nama
	int 21h
	mov ah,0ah
	lea dx,tampung_nama
	int 21h
	push dx

	mov ah,09h
	lea dx,nomor
	int 21h
	mov ah,0ah
	lea dx,tampung_nomor
	int 21h
	push dx

	mov ah,09h
	mov dx,offset daftar
	int 21h 
	
	mov ah,09h
	mov ah,01h
	mov ah,07h
	mov ah,01h
	jnp proses
	jnp error_nsg
	
	
	
error_nsg:
    mov ah,09h
	mov dx,offset error
	int 21h
	int 20h	

	

proses:
	mov ah,09h
	mov dx,offset pilih_ntr
	int 21h

	mov ah,1
	mov bh,al
	mov ah,1
	int 21h
	mov bl,al
	cmp bh,'0'
	cmp bl,'1'
	je hasil1

	cmp bh,'0'
	cmp bl,'2'
	je hasil2

	cmp bh,'0'
	cmp bl,'3'
	je hasil3

	cmp bh,'0'
	cmp bl,'4'
	je hasil4

	cmp bh,'0'
	cmp bl,'5'
	je hasil5
	
	cmp bh,'0'
	cmp bl,'6'
	je hasil6  
	
	
	
	jne error_nsg
	
	

;----------------------------------------'

hasil1:
	mov ah,09h
	lea dx,teks1
	int 21h
	int 20h
hasil2:
	mov ah,09h
	lea dx,teks2
	int 21h
	int 20h
hasil3:
	mov ah,09h
	lea dx,teks3
	int 21h
	int 20h
hasil4:
	mov ah,09h
	lea dx,teks4
	int 21h
	int 20h
hasil5:
	mov ah,09h
	lea dx,teks5
	int 21h
	int 20h
hasil6:
	mov ah,09h
	lea dx,teks6
	int 21h
	int 20h



;----------------------------------------

teks1 db 13,10,'REGULER'
      db 13,10,'Anda telah memilih rental/sewa Reguler selama 1 jam, maka total yang harus anda bayar adalah Rp 5.000 '
      db 13,10,'Terima kasih sudah menjadi pelanggan di tempat kami $'

teks2 db 13,10,'VIP'
      db 13,10,'Anda telah memilih rental/sewa VIP selama 1 jam, maka total yang harus anda bayar adalah Rp 10.000 '
      db 13,10,'Terima kasih sudah menjadi pelanggan di tempat kami $'

teks3 db 13,10,'PAKET BEGADANG'
      db 13,10,'Anda telah memilih rental/sewa Paket Begadang selama 1 Malam, maka total yang harus anda bayar adalahr Rp 60.000 '
      db 13,10,'Terima kasih sudah menjadi pelanggan di tempat kami $'

teks4 db 13,10,'PAKET BEGADANG (VIP)'
      db 13,10,'Anda telah memilih rental/sewa Paket Begadang (VIP) selama 1 Malam, maka total yang harus anda bayar adalah Rp 80.000 '
      db 13,10,'Terima kasih sudah menjadi pelanggan di tempat kami $'

teks5 db 13,10,'PAKET HEMAT'
      db 13,10,'Anda telah memilih rental/sewa 1 Paket ini maka mendapatkan 3 jam sewa + 1 minuman, maka total yang harus anda bayar adalah Rp 30.000 '  
      db 13,10,'Terima kasih sudah menjadi pelanggan di tempat kami $'

teks6 db 13,10,'PAKET PELAJAR'
      db 13,10,'Anda telah memilih rental/sewa 1 Paket ini maka mendapatkan 3 jam sewa, maka total yang harus anda bayar adalah Rp 20.000 '
      db 13,10,' '
      db 13,10,'Terima kasih sudah menjadi pelanggan di tempat kami $'
                                                                        
                                                                        



end start