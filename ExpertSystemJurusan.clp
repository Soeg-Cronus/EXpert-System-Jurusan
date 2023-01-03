;CLIPS VERSION 6.31
;HOW TO USE
;DOWNLOAD CLIPSIDE
;LOAD FILE
;INPUT (reset)
;terus INPUT (run)
;START
(defrule start
 =>
 (printout t "Pemilihan Jurusan Kuliah Expert System" crlf)
 (printout t "======================================" crlf)
 (printout t "By 1) 220116867 - Anderson S." crlf)
 (printout t "   2) 220116876 - Ivan Linhart" crlf)
 (printout t "Pilihan Jurusan Yang Tersedia:" crlf)
 (printout t "1. IT / Sistem Informatika" crlf)
 (printout t "2. SIB / Sistem Informasi Bisnis" crlf)
 (printout t "3. Kedokteran" crlf)
 (printout t "4. Teknik Pangan" crlf)
 (printout t "5. Bahasa" crlf)
 (printout t "6. Rahasia :D" crlf)
 (assert (pertanyaan))
)

;NOTE
;defrule -> semacam function
;assert -> menambahkan fakta
;bind -> menyimpan nilai
;eq -> sama dengan
;crfl -> enter


;AWAL MULA PERTANYAAN
(defrule ask-interest
 (pertanyaan)
 =>
 (printout t "Apakah anda suka matematika? (y/n)" crlf)
   (bind ?answer (read))
   ;answer -> semacam variabel
   (if (eq ?answer y)
   then (assert (interest "suka-matematika"))
   else (assert (interest "tidak-suka-matematika"))
   ;intereset -> variabel buat syarat IF
   )
)


;BERHUBUNGAN SAMA IT
(defrule suka-matematika
 (interest "suka-matematika")
 =>
 (printout t "Apakah anda suka dengan sesuatu yang berhubugnan dengan komputer? (y/n)" crlf)
   (bind ?answer (read))
   (if (eq ?answer y)
   then (assert (interest "suka-komputer"))
   else (assert (interest "tidak-suka-matematika, tidak-suka-komputer"))
   )
)

;IT
(defrule suka-komputer
 (interest "suka-komputer")
 =>
 (printout t "Apakah anda tertarik dengan IT? (y/n)" crlf)
 (bind ?response (read))
 (if (eq ?response y)
   then (assert (interest "suka-it"))
   else (assert (interest "tidak-suka-it"))
 )
)
;SUKA IT
(defrule suka-it
 (interest "suka-it")
 =>
 (printout t "Kami merekemondasikan jurusan Sistem Informatika" crlf)
 (printout t "Terima kasih telah menggunakan sistem ini." crlf)
 (printout t "Jika ingin menggunakan sistem ini lagi, dapat melakukan input (reset) dahulu kemudian (run)" crlf)
 (halt)
)
;TIDAK SUKA IT
(defrule tidak-suka-it
 (interest "tidak-suka-it")
 =>
 (printout t "Apakah anda tertarik dengan jurusan SIB? (y/n)" crlf)
 (bind ?response (read))
 (if (eq ?response y)
   then (assert (interest "suka-sib"))
   else (assert (interest "tidak-suka-matematika, tidak-suka-komputer"))
 )
)
;SIB
(defrule suka-sib
   (interest "suka-sib")
   =>
   (printout t "Kami merekemondasikan jurusan SIstem Informasi Bisnis" crlf)
    (printout t "Terima kasih telah menggunakan sistem ini." crlf)
 (printout t "Jika ingin menggunakan sistem ini lagi, dapat melakukan input (reset) dahulu kemudian (run)" crlf)
 (halt)
)
;BUKAN IT
(defrule tidak-suka-matematika
 (interest "tidak-suka-matematika")
 =>
 (printout t "Apakah anda suka dengan sesuatu yang berhubugnan dengan komputer? (y/n)" crlf)
 (bind ?response (read))
 (if (eq ?response y)
   then (assert (interest "suka-komputer"))
   else (assert (interest "tidak-suka-matematika, tidak-suka-komputer"))
 )
)
;BIOLOGI
(defrule tidak-suka-komputer
 (interest "tidak-suka-matematika, tidak-suka-komputer")
 =>
 (printout t "Yang pasti jangan masuk jurusan yang berhubungan dengan IT :D" crlf)
 (printout t "Apakah anda tertarik dengan biologi? (y/n)" crlf)
 (bind ?response (read))
 (if (eq ?response y)
   then (assert (interest "suka-biologi"))
   else (assert (interest "tidak-suka-pangan, tidak-suka-kedokteran, tidak-suka-biologi"))
 )
)
;SUKA BIOLOGI
(defrule suka-biologi
 (interest "suka-biologi")
 =>
 (printout t "Apakah anda tertarik dengan kedokteran? (y/n)" crlf)
 (bind ?response (read))
 (if (eq ?response y)
   then (assert (interest "suka-kedokteran"))
   else (assert (interest "tidak-suka-kedokteran"))
 )
)
;SUKA KEDOKTERAN
(defrule suka-dokter
 (interest "suka-kedokteran")
 =>
 (printout t "Kami merekemondasikan jurusan Kedokteran" crlf)
 (printout t "Terima kasih telah menggunakan sistem ini." crlf)
 (printout t "Jika ingin menggunakan sistem ini lagi, dapat melakukan input (reset) dahulu kemudian (run)" crlf)
 (halt)
)
;TIDAK SUKA KEDOKTERAN
(defrule tidak-suka-kedokteran
 (interest "tidak-suka-kedokteran")
 =>
 (printout t "Apakah anda tertarik dengan teknik pangan? (y/n)" crlf)
 (bind ?response (read))
 (if (eq ?response y)
   then (assert (interest "suka-pangan"))
   else (assert (interest "tidak-suka-pangan, tidak-suka-kedokteran, tidak-suka-biologi"))
 )
)
;SUKA PANGAN
(defrule suka-pangan
 (interest "suka-pangan")
 =>
 (printout t "Kami merekemondasikan jurusan Teknik Pangan" crlf)
 (printout t "Terima kasih telah menggunakan sistem ini." crlf)
 (printout t "Jika ingin menggunakan sistem ini lagi, dapat melakukan input (reset) dahulu kemudian (run)" crlf)
 (halt)
)
;TIDAK SUKA BIOLOGI
(defrule tidak-suka-biologi
   (interest "tidak-suka-pangan, tidak-suka-kedokteran, tidak-suka-biologi")
   =>
   (printout t "Jangan pilih jurusan yang berhubungan sama Biologi :D" crlf)
   (printout t "Apakah anda suka Membaca? (y/n)" crlf)
   (bind ?response (read))
   (if (eq ?response y)
      then (assert (interest "suka-baca"))
      else (assert (interest "tidak-suka-biologi, tidak-suka-komputer, tidak-suka-baca"))
   )
)
;SUKA BACA
(defrule suka-baca
   (interest "suka-baca")
   =>
 (printout t "Kami merekemondasikan jurusan Bahasa!" crlf)
 (printout t "Terima kasih telah menggunakan sistem ini." crlf)
 (printout t "Jika ingin menggunakan sistem ini lagi, dapat melakukan input (reset) dahulu kemudian (run)" crlf)
 (halt)
)
;GASUKA APA2
(defrule tidak-suka-semua
 (interest "tidak-suka-biologi, tidak-suka-komputer, tidak-suka-baca")
 =>
 (printout t "Gausah Kuliah :D" crlf)
 (halt)
)
