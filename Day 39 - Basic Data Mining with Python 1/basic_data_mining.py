
import numpy as np
import matplotlib.pyplot as plt

# array berisi 50 angka acak antara 0 dan 100
array = np.random.randint(0, 101, size=50)

# Rata-rata, Median, dan Standar Deviasi
rata_rata = np.mean(array)
median = np.median(array)
standar_deviasi = np.std(array)


lebih_dari_rata_rata = array[array > rata_rata]
angka_genap = array[array % 2 == 0]
angka_genap_min = np.min(angka_genap) if len(angka_genap) > 0 else None
angka_genap_max = np.max(angka_genap) if len(angka_genap) > 0 else None
matriks_5x10 = array.reshape(5, 10)
matriks_transpose = matriks_5x10.T
jumlah_baris = np.sum(matriks_transpose, axis=1)

# List Hasilnya
print('Array:', array)
print('Rata-rata:', rata_rata)
print('Median:', median)
print('Standar Deviasi:', standar_deviasi)
print('Angka Lebih Besar dari Rata-rata:', lebih_dari_rata_rata)
print('Angka Genap:', angka_genap)
print('Angka Genap Minimum:', angka_genap_min)
print('Angka Genap Maksimum:', angka_genap_max)
print('Matriks 5x10:', matriks_5x10)
print('Matriks Transpose:', matriks_transpose)
print('Jumlah per Baris:', jumlah_baris)

# Histogram
plt.hist(array, bins=10, color='blue', edgecolor='black')
plt.title('Histogram dari Array')
plt.xlabel('Nilai')
plt.ylabel('Frekuensi')
plt.show()
