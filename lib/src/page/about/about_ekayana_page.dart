import 'package:ekayanaarama/ekayana.dart';
import 'package:ekayanaarama/src/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutEkayanaPage extends StatelessWidget {
  const AboutEkayanaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorToken.white,
      appBar: NavBarComponent(
        title: "Tentang Ekayana",
        onNavigationTap: () => Get.back(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('asset/drawable/ekayana.png'),
            const SizedBox(
              height: 14,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "Wihaya Ekayana Arama",
                      style: TypographyToken.textLargeBold,
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  TextIconComponent(
                    iconLeft: Iconography.markerPin_01,
                    text:
                        "Jl. Mangga II No. 8 Duri Kepa, Greenville - Tanjung Duren Barat Jakarta Barat 11510",
                    textStyle: TypographyToken.textSmallSemiBold,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextIconComponent(
                    iconLeft: Iconography.phone,
                    text: "(021) 5687921 / (021) 5687922",
                    textStyle: TypographyToken.textSmallSemiBold,
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(RouteName.danaInformation),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: TextIconComponent(
                        text: "Informasi Dana",
                        iconRight: Iconography.chevronRight,
                        iconColor: ColorToken.primary_500,
                        textStyle: TypographyToken.textMediumSemiBold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(
                      RouteName.aboutDetailEkayana,
                      arguments: {
                        'content': "Wihara Ekayana Arama – Indonesia Buddhist Centre adalah salah satu pusat belajar, berlatih, dan pelayanan agama Buddha. Saat ini selain sebagai tempat tinggal para monastik yang tergabung dalam Sangha Agung Indonesia, juga merupakan tempat kegiatan umat Buddha dan tempat penyebaran Dharma ke seluruh Indonesia.<br><br>Menyadari adanya kesenjangan antara Dharma yang diketahui dan Dharma yang dipraktikkan, Wihara Ekayana Arama berupaya menjaga Dharma yang hidup melalui penerapan praktik sadar-penuh dalam berbagai aktivitas. Dharma yang hidup adalah Agama Buddha Inti, warisan sesungguhnya dari Buddha Sakyamuni. Saat enam puluh biksu yang telah menjadi Arahat ditugaskan Buddha untuk menyebarkan Dharma, belum banyak Dharma lisan yang disampaikan dan belum ada Dharma tulisan. Di tengah berbagai metode pelatihan diri yang kini tersedia bagi umat manusia, Agama Buddha Inti adalah Jalan Tunggal (Ekayana) yang sekaligus menunjukkan kesatuan dari agama Buddha.<br><br>Dalam pembacaan sutra, paritta, mantra, atau nama Buddha, pengikut Jalan Tunggal menjalankannya sebagai praktik sadar-penuh. Dalam mendengar ceramah Dharma atau membaca buku Dharma, pengikut Jalan Tunggal menjalankannya sebagai praktik sadar-penuh. Dalam pelatihan meditasi atau retret, pengikut Jalan Tunggal menjalankannya sebagai praktik sadar-penuh. Dalam melakukan aksi pelayanan sosial, pengikut Jalan Tunggal menjalankannya sebagai praktik sadar-penuh.<br><br>Para monastik Wihara Ekayana Arama merupakan kelanjutan yang tak terputus dari Buddha Sakyamuni. Melalui silsilah perguruan Chan Linji dan Nanshan Guanghua (Kong Hua Sie), serta kedatangan Mahabiksu Aryamula Benqing untuk menetap di Indonesia lahirlah generasi dari Buddhayana Indonesia (Sangha Agung Indonesia), yaitu Mahabiksu Ashin Jinarakkhita, Biksu Dharmaji Uggadhammo, dan Biksu Aryamaitri beserta murid-murid, cucu-cucu murid, dan cicit-cicit muridnya.<br><br>Chan (atau Zen dalam bahasa Jepang) berasal dari kata Sanskerta “Dhyana”, oleh karena itu realisasi pengalaman langsung melalui Dharma praktis dan meditasi dalam kehidupan sehari-hari menjadi ciri perguruan Chan. Chan dibawa ke Tiongkok oleh Y.A. Bodhidharma, seorang pangeran India yang menjadi biksu. Pada awalnya ajaran Y.A. Bodhidharma ini disebut Ekayana (Jalan Tunggal) dari India. Ekayana diajarkan dalam Sutra Lankavatara, sutra yang terkait erat dengan Y.A. Bodhidharma. Namun istilah Ekayana kemudian tidak banyak digunakan, ajaran Y.A. Bodhidharma lebih dikenal sebagai perguruan Chan dan Y.A. Bodhidharma menjadi Sesepuh Tiongkok yang pertama.<br><br>Chan tersebar dengan cepat melalui Sesepuh Tiongkok yang ke-6, Y.A. Hui Neng. Dalam perjalanan waktu, Chan mengisi peradaban Tiongkok, mengangkat pemikirannya, budayanya, dan seninya ke ketinggian yang maha mulia. Terdapat lima perguruan yang muncul dari garis keturunan spiritual Y.A. Hui Neng. Dari lima perguruan tersebut, yang saat ini masih terus berkembang adalah Linji dan Caodong. Y.A. Linji Yixuan merupakan sesepuh pertama Perguruan Linji. Dari perguruan Linji, muncullah sub-perguruan Nanshan Guanghua, dengan Y.A. Shan-he sebagai sesepuh pertamanya.<br><br>Y.A. Shan-he adalah seorang biksu yang pada tahun 1890 berhasil membangun kembali Kong Hua Sie (Guanghua Shi) yang terletak di pinggir kota Putian, Provinsi Fujian, Tiongkok. Sebelumnya bangunan wihara yang didirikan pertama kali pada tahun 558 itu dalam kondisi rusak berat dan hanya tinggal dua orang biksu yang menetap di sana.<br><br>Salah seorang dari generasi ke-4 sub-perguruan Nanshan Guanghua, yaitu Y.A. Benqing (Pen Ching) pada tahun 1901 menjejakkan kakinya pertama kali di bumi Indonesia. Sebelum bertempat tinggal di Jakarta, beliau sempat berkunjung dan menata wihara-wihara: Thay Kak Sie (Semarang), Hiap Thian Kiong (Bandung), Tiau Kak Sie (Cirebon), Kuan Ti Bio (Karawang), dan lain-lain. Pada tahun 1926 beliau berdiam di Cetya Yi-Lian Thang, Jakarta, milik seorang biarawati tua. Melihat keteladanan beliau dalam melatih diri menjalankan kehidupan yang suci dan sederhana, cetya ini kemudian dipersembahkan oleh biarawati tua tersebut kepada beliau. Dengan dukungan banyak umat, beliau kemudian membangunnya menjadi Wihara Kong Hua Sie di Indonesia.<br><br>Wihara Kong Hua Sie di Jakarta berdiri pada tahun 1950, dalam prasasti tercantum nama tiga biksu yang meresmikannya, yaitu Y.A. Pen Ching, Y.A. Thi Phan (dari Thay Kak Sie Semarang), dan Y.A. Yuan Ren (dari Thay Hin Bio Lampung). Di wihara inilah pada tahun 1953, di hari peringatan Kesempurnaan Bodhisattwa Awalokiteswara, Samanera Thi Cen (Tizheng)—yang kemudian dikenal sebagai Y.A. Ashin Jinarakkhita, pelopor kebangkitan kembali agama Buddha di Indonesia—ditahbiskan oleh Y.A. Pen Ching. Saat ini penanggung jawab Wihara Kong Hua Sie adalah Y.A. Aryamaitri.<br><br>Berpegang pada Agama Buddha Inti, para biksu Kong Hua Sie tidak sektarian. Sebagai contoh, untuk menjaga agar pikiran tidak mengembara, metode merapal nama Buddha Amitabha juga digunakan. Semangat non-sektarian juga ditunjukkan oleh Y.A. Benqing ketika mengirim muridnya ke Myanmar untuk belajar meditasi dan menerima penahbisan sebagai biksu dari Y.A. Mahasi Sayadaw, guru meditasi wipassana dengan reputasi internasional.<br><br>Y.A. Ashin Jinarakkhita, yang merupakan pelopor kebangkitan kembali agama Buddha di Indonesia, dengan demikian memiliki dua guru penahbis, yaitu Y.A. Benqing (praktisi Chan Mahayana) dan Y.A. Mahasi Sayadaw (praktisi Wipassana Therawada). Selain berkeliling ke daerah-daerah yang melahirkan wihara-wihara dan memberikan bimbingan meditasi yang melahirkan para pandita, Y.A. Ashin Jinarakkhita juga memadukan Therawada dan Mahayana dalam gerakan Buddhayana untuk menghadirkan Agama Buddha Indonesia, yaitu agama Buddha yang esensial dan kontekstual.<br><br>Salah seorang murid dari Y.A. Ashin Jinarakkhita, yaitu Y.A. Uggadhammo adalah biksu yang aktif menyebarkan agama Buddha dengan cara-cara yang membumi. Agama Buddha Indonesia menurut Y.A. Uggadhammo adalah agama Buddha universal yang membumi. Selain berceramah ke berbagai daerah dengan tema kehidupan sehari-hari yang mudah dipahami, Y.A. Uggadhammo juga banyak menulis naskah Dharma dan menerjemahkan buku-buku Dharma. Sebagai seniman, Y.A. Uggadhammo juga menulis puisi dan mengubah lagu-lagu Buddhis. Sebelum menjadi biksu, Y.A. Uggadhammo adalah seorang pandita di Wihara Mahabodhi Semarang.<br><br>Y.A. Aryamaitri, Kepala Wihara Ekayana Arama, menjadi biksu dengan guru Y.A. Uggadhammo, dan menerima transmisi sila bodhisattwa dari Y.A. Pai Sheng, &lt;em&gt;President World Buddhist Sangha Council&lt;/em&gt; (WBSC). Lima tahun pertama sebagai biksu, Y.A. Aryamaitri aktif berkeliling di Sumatera Utara, Aceh, Sumatera Barat, Riau, dan Kepulauan Riau. Selanjutnya ketika terpilih sebagai Sekjen Sangha Agung Indonesia, Y.A. Aryamaitri aktif berkeliling ke hampir seluruh Indonesia, terutama untuk memberikan pengarahan baik kepada umat Buddha di daerah maupun kepada para pengurus wihara, yayasan, dan Majelis Buddhayana Indonesia setempat. Mereka yang pernah mendengarkan pengarahan Y.A. Aryamaitri, termasuk para biksu murid-muridnya, menilai bahwa Y.A. Aryamaitri sangat piawai dalam memberikan pengarahan, apa yang disampaikan selalu tepat dan akurat baik dalam permasalahannya maupun dalam solusinya. Sebagai orang yang dekat dengan Y.A. Ashin Jinarakkhita, penerapan agama Buddha inti yang membumi juga menjadi visi Y.A. Aryamaitri. Wihara Ekayana Arama yang dipimpinnya mempunyai visi menjadi pusat pengembangan agama Buddha yang esensial dan kontekstual. Saat ini Y.A. Aryamaitri juga menjabat sebagai Vice President World Buddhist Sangha Council (WBSC).<br><br>Dalam mewujudkan visi dan misi Wihara Ekayana Arama, selain dibantu oleh murid-muird dan cucu-cucu muridnya, Y.A. Aryamaitri didampingi oleh Y.A. Dharmavimala selaku wakil kepala. Y.A. Dharmavimala adalah murid Y.A. Yuan Zhuo (Sesepuh Wihara Kong Hua Sie di Tiongkok) dan cucu murid Y.A. Thi Phan dari Wihara Thay Kak Sie Semarang. Y.A. Thi Pan adalah murid dari Y.A. Pen Ru, saudara seperguruan Y.A. Pen Ching. Beserta murid-muridnya, Y.A. Pen Ru datang ke Indonesia untuk melanjutkan pembinaan di wihara-wihara yang telah ditata oleh Y.A. Pen Ching.<br><br>Murid-murid dan cucu-cucu murid Y.A. Aryamaitri yang sebelumnya belajar, berlatih, dan mengabdi di Wihara Ekayana Arama, kini telah banyak yang mengabdikan diri di wihara-wihara dan kota-kota lain di Indonesia, mulai dari Medan sampai Makassar. Wihara Ekayana Arama juga mendukung pembangunan sejumlah wihara baru di Tangerang setelah mengetahui terdapat persamuhan umat Buddha yang bersemangat. Buku-buku terbitan Dian Dharma dan Karaniya telah membantu pemahaman Dharma umat Buddha di seluruh Indonesia. Bursa Prapanca yang menyediakan buku-buku Dharma, CD/VCD/DVD, rupang Buddha/Bodhisattwa, dan asesoris Buddhis lainnya, selain melayani umat di Wihara Ekayana Arama, juga melayani umat dari luar daerah serta bursa-bursa dari wihara lain di seluruh Indonesia. Pusdiklat Agama Buddha Indonesia yang diketuai Maha Upasaka Pandita Krishnanda Wijaya-mukti telah mengadakan kursus dan retret di berbagai provinsi. Wihara Ekayana Arama juga berbagi ke daerah manakala mengundang guru Dharma dari luar negeri.",
                      },
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: TextIconComponent(
                        text: "Sejarah Singkat",
                        iconRight: Iconography.chevronRight,
                        iconColor: ColorToken.primary_500,
                        textStyle: TypographyToken.textMediumSemiBold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(
                      RouteName.aboutDetailEkayana,
                      arguments: {
                        'content': "<h3>Visi</h3>Menjadi pusat pengembangan agama Buddha yang esensial dan kontekstual. <br><h3>Misi</h3>1. Menjadikan Wihara Ekayana Arama sebagai rumah bersama untuk belajar, berlatih, dan berbagi.<br>2. Membina umat menjadi manusia yang berkesadaran penuh, menyadari saling keterkaitan, dan mengutamakan keharmonisan.<br>3. Melayani umat dengan hati terbuka dan semangat cinta kasih bagi semua.<br>4. Mencetak kader, baik monastik maupun umat awam, yang mampu melayani sesuai dengan perkembangan jaman.<br>5. Meningkatkan pelayanan dalam bidang pendidikan, kesehatan, dan kebudayaan bagi kesejahteraan masyarakat.",
                      },
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: TextIconComponent(
                        text: "Visi & Misi",
                        iconRight: Iconography.chevronRight,
                        iconColor: ColorToken.primary_500,
                        textStyle: TypographyToken.textMediumSemiBold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(
                      RouteName.aboutDetailEkayana,
                      arguments: {
                        'content': "Ada beberapa jadwal kebaktian rutin di Wihara Ekayana Arama. Dalam kebaktian umum Mandarin yang diadakan pada setiap hari Minggu pk. 08.00 - 09.30 dan hari Uposatha tanggal 1 dan 15 Imlek pk. 19.00 - 21.00, umat dilayani oleh para relawan yang tergabung dalam Himpunan Maitricitta. Adapun untuk kebaktian umum Pali setiap hari Minggu pk. 17.00 - 19.00 terdapat Komunitas Kebaktian Minggu Sore. Kebaktian untuk anak-anak, remaja, dan pemuda/mahasiswa masing-masing dilayani oleh Komisi Anak, Komisi Remaja, dan Komisi Pemuda/Mahasiswa dari Pranama (Pemuda Wihara Ekayana Arama). Korps Pandita dan Upacarika bertugas mengatur jadwal penceramah yang bukan monastik.<br><br>Pelayanan umat selain kebaktian rutin meliputi: pemberkahan rumah/tempat usaha baru, kunjungan kasih untuk penghiburan orang sakit baik di rumah sakit maupun di rumah tinggal, kunjungan kasih untuk penghiburan orang lanjut usia, pelimpahan jasa bagi yang meninggal dunia, serta upacara pengukuhan pernikahan. Selain dilakukan oleh monastik, kunjungan kasih dan pelimpahan jasa bagi yang meninggal juga dilakukan oleh umat relawan yang tergabung dalam Himpunan Karunaduta. Kunjungan kasih secara rutin dilakukan oleh Himpunan Karunaduta setiap hari Sabtu pk. 10.00 - selesai dan setiap hari Selasa pk. 10.00 - selesai. Upacara pengukuhan pernikahan ditangani oleh para pandita dan upacarika yang bertugas untuk itu.<br><br>Pelayanan umat juga dilayani oleh Wulan Bahagia (Warga Usia Lanjut Bahagia) dan WBE (Wanita Buddhis Ekayana) untuk anggota masing-masing organisasi. Kegiatan Wulan Bahagia diadakan setiap hari Sabtu (minggu I, II, dan III) pukul 13.00 - 17.00.",
                      },
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: TextIconComponent(
                        text: "Kebaktian & Pelayanan Umat",
                        iconRight: Iconography.chevronRight,
                        iconColor: ColorToken.primary_500,
                        textStyle: TypographyToken.textMediumSemiBold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(
                      RouteName.aboutDetailEkayana,
                      arguments: {
                        'content': "Dharma Class di Wihara Ekayana Arama diadakan sejak tahun 1997 setiap hari Minggu pk. 08.30 - 10.00, saat ini telah dibuka Dharma Class II yang diperuntukkan terutama untuk para orangtua yang selama ini menemani anak-anaknya mengikuti sekolah minggu, yaitu setiap hari Minggu pk. 09.00 - 10.00.<br><br>Latihan Meditasi di Wihara Ekayana Arama saat ini terdiri dari dua jenis, yaitu Wipassana dan Chan (Zen). Latihan meditasi Chan diadakan setiap hari Kamis pk. 19.00 - 21.00 dan latihan meditasi Wipassana setiap hari Jumat pk. 19.00 - 21.00.<br><br>Pusat Pendidikan dan Pelatihan Agama Buddha Indonesia (Pusdiklat ABI) didirikan di Wihara Ekayana Arama pada tahun 2004 dengan persetujuan Sangha Agung Indonesia dan lingkup kerjanya berskala nasional. Pusdiklat ABI memiliki dua divisi, yaitu Divisi Kursus dan Divisi Retret. Divisi Kursus antara lain menyelenggarakan: Kursus Dasar Agama Buddha (KDAB), Kursus Dasar Buddhayana (KDB) atau dikenal pula dengan nama Kursus Dharma Universal (KDU), dan Kursus Bimbingan Pra-nikah. Divisi Retret antara lain menyelenggarakan: Retret Hidup Berkesadaran (RHB)—yang dapat disajikan untuk umum atau secara khusus untuk keluarga, anak, remaja, guru, maupun aktivis—dan Day of Mindfulness (DoM). Dalam pelaksanaannya, Pusdiklat ABI bertugas menyediakan materi dan tenaga pengajar/pelatih, sedang kepanitiaan menjadi tugas dari organisasi penyelenggara.<br><br>Wihara Ekayana Arama sendiri saat ini telah memiliki tiga tempat retret, yaitu Pondok Sadhana Amitayus di Desa Kopo, Cipayung, Puncak, Kabupaten Bogor; Pondok Sadhana Suddhi Bhavana di Desa Jambudipa, Kabupaten Bandung Barat; dan Prasada Mandala Dharma di Parakan, Kabupaten Temanggung. Dengan terus bertambahnya peminat retret, pada saatnya tempat-tempat retret juga memerlukan perluasan kapasitas.<br><br>Untuk memajukan pendidikan, di Wihara Ekayana Arama juga terdapat perpustakaan dan pelayanan kursus bahasa Mandarin. Perpustakaan Manjusri menyimpan koleksi buku-buku Dharma baik yang berbahasa Indonesia, Inggris, maupun Mandarin. Perpustakaan ini merupakan sumber referensi bagi para biksu maupun umat, antara lain untuk mendalami topik-topik tertentu dari ajaran Buddha.<br><br>Saat ini Wihara Ekayana Arama juga menaungi 2 Sekolah Buddhis, yaitu Sekolah Tri Ratna Jakarta dan Ekayana Ehipassiko School, BSD, Banten. Sekolah-Sekolah Buddhis ini menekankan pentingnya pendidikan berkarakter Buddhis di era Millenial ini untuk membekali anak-anak agar menjadi manusia yang berkarakter yang baik dan sesuai dengan nilai-nilai Buddhistik.",
                      },
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: TextIconComponent(
                        text: "Pendidikan & Pelatihan",
                        iconRight: Iconography.chevronRight,
                        iconColor: ColorToken.primary_500,
                        textStyle: TypographyToken.textMediumSemiBold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(
                      RouteName.aboutDetailEkayana,
                      arguments: {
                        'content': "Balai Pengobatan Jivaka sejak didirikan pada tahun 1997 telah memberikan pelayanan pengobatan murah bagi umat dan masyarakat yang ada di sekitarnya. Kegiatannya meliputi pengobatan umum dan pengobatan gigi. Juga mengadakan operasi kecil. Balai Pengobatan Jivaka bekerja sama dengan laboratorium besar secara rutin mengadakan program medical check up dengan harga murah. Pada waktu-waktu tertentu yang tepat, Balai Pengobatan Jivaka juga mengadakan bakti sosial pengobatan massal gratis. Agar pelayanan Balai Pengobatan Jivaka ini berkesinambungan, penggalangan dana secara mandiri dan donasi pun dilakukan. Hasil bersih dari Kantin Vegetarian Sujata digunakan untuk mensubsidi pelayanan pengobatan murah di Balai Pengobatan Jivaka ini.<br><br>Wihara Ekayana Arama juga pernah menyediakan diri sebagai Griya Asuh bagi 13 (tiga belas) orang anak asuh korban gempa bumi dan tsunami dari Banda Aceh. Saat ini mereka yang semula pada saat bencana alam masih duduk di kelas I dan II SMA semuanya telah menjadi sarjana. Pembiayaan pendidikan maupun hidup mereka sehari-hari tentunya tidak lepas dari adanya para donatur yang berhati mulia. Semoga mereka akan dapat menjadi orang yang berguna bagi nusa dan bangsa.<br><br>Agar rasa kemanusiaan senantiasa tumbuh, utamanya cinta kasih dan kepedulian di antara sesama umat Wihara Ekayana Arama, dibentuklah Ekayana Peduli (EP). Melalui celengan “Setiap Hari Berbuat Bajik”, banyak umat yang setiap hari pikirannya akan dipenuhi kegembiraan karena dapat berbagi untuk sesama. Dana yang terkumpul kemudian disalurkan untuk bantuan sosial, kesehatan, dan pendidikan.<br><br>Bantuan sosial diberikan kepada umat yang tertimpa musibah atau bencana, juga untuk penyelenggaraan bakti sosial dan kegiatan-kegiatan kepedulian sosial lainnya. Bantuan kesehatan diberikan kepada umat yang membutuhkan bantuan untuk biaya pengobatan atau perawatan di rumah sakit. Bantuan pendidikan diberikan dalam bentuk pemberian beasiswa untuk anak-anak yang orangtuanya tidak mampu.<br><br>Ekayana Peduli juga memiliki kelompok relawan yang menyelenggarakan aksi donor darah massal, pengobatan massal, pembagian sembako, dan bakti sosial lainnya. Aksi donor darah massal dilakukan secara rutin setiap tiga bulan sekali dengan peserta berkisar 200-300 orang. Ketua Umum PMI Jusuf Kalla pernah hadir meninjau aksi donor darah massal di Wihara Ekayana Arama.",
                      },
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: TextIconComponent(
                        text: "Pelayanan Sosial",
                        iconRight: Iconography.chevronRight,
                        iconColor: ColorToken.primary_500,
                        textStyle: TypographyToken.textMediumSemiBold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(
                      RouteName.aboutDetailEkayana,
                      arguments: {
                        'content': "Penerbit Dian Dharma yang berdiri tahun 1995 sampai saat ini telah menerbitkan ratusan judul buku Dharma dan judul CD/VCD/DVD untuk dibagikan secara gratis ke seluruh Indonesia. Bagi mereka yang ingin berbuat kebajikan melalui penyebaran buku dan CD Dharma, silakan menjadi donatur tetap maupun donatur tidak tetap Penerbit Dian Dharma. Penerbit Dian Dharma juga siap membantu mereka yang ingin mencetak buku untuk pelimpahan jasa.<br><br>Berbeda dengan Penerbit Dian Dharma, Penerbit Karaniya memfokuskan diri untuk menghadirkan buku-buku Dharma di toko-toko buku. Buku-buku Karaniya juga disalurkan melalui wihara-wihara di seluruh Indonesia. Dilandasi semangat Buddhayana yang non-sektarian, Penerbit Karaniya menerbitkan buku-buku Dharma baik dari tradisi Therawada, Mahayana, maupun Wajrayana. Dalam memperbanyak koleksi buku Dharma di Indonesia, Penerbit Karaniya bekerja sama dengan berbagai penerbit di seluruh dunia. Dengan motto “Dharma Universal Bagi Semua”, Penerbit Karaniya telah menerbitkan lebih dari 200 judul buku.<br><br>The Middle Way Bookstore adalah Toko Buku Karaniya sekaligus Galeri Penerbit Dian Dharma, terletak di lantai dasar Wisma Jayawardhana, Jalan Mangga I Blok F No. 15, Duri Kepa, Jakarta Barat. Selain buku-buku Dharma dan CD/VCD/DVD, The Middle Way Bookstore juga menyediakan rupang Buddha/Bodhisattwa, dan asesoris Buddhis lainnya.<br><br>Bursa Prapanca yang terletak dekat dengan gedung utama Wihara Ekayana Arama juga menyediakan buku-buku Dharma, CD/VCD/DVD, rupang Buddha/Bodhisattwa, dan asesoris Buddhis lainnya. Selain melayani umat di Wihara Ekayana Arama, Bursa Prapanca juga melayani umat dari luar daerah serta bursa-bursa dari wihara lain di seluruh Indonesia.<br><br>Kantin Vegetarian Sujata adalah salah satu bentuk usaha yang dilakukan untuk memberikan pelayanan dan dukungan bagi mereka memerlukan makanan vegetarian. Memberi kemudahan bagi mereka yang berkomitmen untuk praktik vegetarian maupun bagi mereka yang akan memberikan persembahan makanan untuk orang yang telah meninggal. Hasil bersih dari Kantin Vegetarian Sujata ini disalurkan untuk mensubsidi Balai Pengobatan Jivaka yang bersifat sosial.",
                      },
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: TextIconComponent(
                        text: "Media & Unit Usaha",
                        iconRight: Iconography.chevronRight,
                        iconColor: ColorToken.primary_500,
                        textStyle: TypographyToken.textMediumSemiBold,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => Get.toNamed(
                      RouteName.aboutDetailEkayana,
                      arguments: {
                        'content': "Generasi muda memiliki wadah bernama Pranama (Pemuda Wihara Ekayana Arama) yang berdiri pada 17 September 1995. Saat berdiri Pranama bernama Persaudaraan Muda-mudi Vihara Ekayana Grha (PMVEG). PMVEG merupakan organisasi yang pertama di Wihara Ekayana Arama. Untuk mempertajam fokus pembinaan generasi muda, dibentuk Komisi Anak, Komisi Remaja, serta Komisi Pemuda, yang sekarang sudah berkembang dan bertambah unit kegiatan lain seperti Ekayana Buddhist Residence Choir (EBRC), Ekayana Youth Dancer (EYD), Ekayana Barongsai dan Kungfu (Ebaku).<br><br>Komisi Anak bertugas memberikan bekal Dharma dengan cara-cara yang menarik dan berbagai permainan kepada anak-anak usia pra-sekolah, TK, hingga SD melalui Gabrama (Gelanggang Anak-Anak Buddhis Wihara Ekayana Arama). Anak-anak dibagi menjadi lima kelas berdasarkan kelompok usianya. Kegiatan Gabrama atau sekolah minggu dilaksanakan setiap hari Minggu pk. 08.30 - 10.00.<br><br>Komisi Remaja bertugas melayani dan menghimpun para remaja, yaitu mereka yang duduk di bangku SMP dan SMA, untuk mengikuti kebaktian, belajar Dharma, berlatih meditasi, dan berbagi dalam suasana yang penuh persaudaraan. Kebaktian Komisi Remaja diadakan setiap hari Minggu pk. 08.30 - 10.00.<br><br>Komisi Pemuda bertugas melayani dan menghimpun para pemuda dan mahasiswa untuk mengikuti kebaktian, belajar Dharma, berlatih meditasi, dan berbagi dalam suasana yang penuh persaudaraan. Pada awalnya mayoritas umat di Wihara Ekayana Arama adalah mahasiswa dikarenakan letak Wihara Ekayana Arama yang dekat dengan kampus-kampus sejumlah universitas terkenal, seperti Bina Nusantara, Trisakti, Tarumanegara, dan Ukrida. Kebaktian Komisi Pemuda diadakan setiap hari Minggu pk. 10.00 - 12.00 di Baktisala Utama, Wihara Ekayana Arama.<br><br>Ekayana Buddhist Resident Choir (EBRC) dan Ekayana Buddhist Children Choir (EBCC) merupakan kelompok paduan suara Wihara Ekayana Arama. EBRC dan EBCC selalu tampil dalam berbagai acara besar yang diadakan Wihara Ekayana Arama dan juga diundang untuk tampil di acara lain termasuk di acara yang berskala nasional. Jadwal latihan EBRC setiap hari Minggu pk. 13.00 di Lt. 2 Ruang 8K, Gedung Utama Wihara Ekayana Arama.<br><br>Ekayana Youth Dancer (EYD) merupakan kelompok muda-mudi yang senang berlatih seni tari. Seperti halnya EBRC, EYD juga diminta tampil menunjukkan hasil latihannya manakala ada acara besar yang diadakan Wihara Ekayana Arama dan juga terkadang diminta mengisi acara-acara keagamaan maupun non-keagamaan di luar Wihara. Jadwal latihan EYD setiap hari Kamis pk. 19.00 di Gedung Kalyanawardhana lantai 5, Wihara Ekayana Arama.<br><br>Ekayana Barongsai dan Kungfu (Ebaku) adalah kelompok muda-mudi yang senang berlatih kungfu dan bermain barongsai. Ebaku merupakan reinkarnasi dari EBG (Ekayana Barongsai Group) yang mengalami masa-masa keaktifan yang luar biasa pada saat awal reformasi. Jadwal latihan Ebaku setiap hari Rabu dan Jumat, pk. 19.00 di Lt. 1 Gedung Asokawardhana, Wihara Ekayana Arama.<br><br>Komunitas Taiji “Damai” (He Ping) melakukan latihan bersama Taiji di halaman parkir Wihara Ekayana Arama setiap pagi pk. 06.00 - 07.00. Peserta yang mengikuti latihan Taiji ini kebanyakan adalah mereka yang telah masuk kategori wulan (warga usia lanjut), namun belakangan tampak pula banyak peserta yang berusia jauh lebih muda. Baik yang tua maupun muda merasakan manfaat berlatih Taiji, yaitu mereka menjadi lebih sehat lahir dan batin.<br><br>Sejak tahun 2018, terbentuk komunitas baru yaitu Terapi Kesehatan \"Yuan Shi Dian\" yang menggunakan teknik pemijatan tertentu untuk kesehatan. Komunitas ini mengajarkan teknik-teknik pemijatan kepada anggota-anggota yang ingin belajar maupun kepada umat yang ingin mencoba terapi ini untuk kesehatan. Pelatihan terapi kesehatan ini dilakukan setiap hari Selasa pk. 19.00, dan praktiknya dilakukan setiap hari Sabtu pk. 9.00 di Gedung Kalyanawardhana lantai 5, Wihara Ekayana Arama."
                      },
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: TextIconComponent(
                        text: "Generasi Muda, Seni Budaya & Olah Raga",
                        iconRight: Iconography.chevronRight,
                        iconColor: ColorToken.primary_500,
                        textStyle: TypographyToken.textMediumSemiBold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Di sini kita bersatu dan bersaudara \nDi sini kita belajar dan mengerti \nDi sini kita berkarya dan berbakti \nDi sini kita mengabdi",
                    style: TypographyToken.textSmallRegular.apply(
                      color: ColorToken.gray_500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
