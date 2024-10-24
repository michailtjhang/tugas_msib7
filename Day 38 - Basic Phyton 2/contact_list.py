# Inisialisasi daftar kontak sebagai list of dictionaries
contacts = []

# Fungsi untuk menampilkan semua kontak
def show_contacts():
    if contacts:
        print("\nDaftar Kontak:")
        for idx, contact in enumerate(contacts, start=1):
            print(f"ID: {idx}, Nama: {contact['nama']}, Nomor Telepon: {contact['telepon']}")
    else:
        print("\nTidak ada kontak yang tersedia.")

# Fungsi untuk menambahkan kontak baru
def add_contact():
    nama = input("Masukkan nama: ")
    telepon = input("Masukkan nomor telepon: ")
    contacts.append({"nama": nama, "telepon": telepon})
    print("Kontak berhasil ditambahkan.")

# Fungsi untuk mengubah kontak yang sudah ada
def update_contact():
    show_contacts()
    id_kontak = int(input("\nMasukkan ID kontak yang ingin diubah: ")) - 1
    if 0 <= id_kontak < len(contacts):
        nama = input("Masukkan nama baru: ")
        telepon = input("Masukkan nomor telepon baru: ")
        contacts[id_kontak] = {"nama": nama, "telepon": telepon}
        print("Kontak berhasil diubah.")
    else:
        print("ID kontak tidak valid.")

# Fungsi untuk menghapus kontak
def delete_contact():
    show_contacts()
    id_kontak = int(input("\nMasukkan ID kontak yang ingin dihapus: ")) - 1
    if 0 <= id_kontak < len(contacts):
        contacts.pop(id_kontak)
        print("Kontak berhasil dihapus.")
    else:
        print("ID kontak tidak valid.")

# Fungsi utama untuk menjalankan aplikasi
def main():
    while True:
        print("\nMenu Kontak:")
        print("1 - Tampilkan Kontak")
        print("2 - Tambah Kontak")
        print("3 - Ubah Kontak")
        print("4 - Hapus Kontak")
        print("5 - Keluar")
        
        pilihan = input("Pilih menu (1/2/3/4/5): ")
        
        if pilihan == '1':
            show_contacts()
        elif pilihan == '2':
            add_contact()
        elif pilihan == '3':
            update_contact()
        elif pilihan == '4':
            delete_contact()
        elif pilihan == '5':
            print("Keluar dari aplikasi...")
            break
        else:
            print("Pilihan tidak valid. Silakan coba lagi.")

# Menjalankan fungsi utama
if __name__ == "__main__":
    main()
