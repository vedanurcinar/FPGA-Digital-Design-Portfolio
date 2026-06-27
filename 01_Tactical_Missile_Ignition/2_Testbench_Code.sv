module tb_Tactical_Missile;
  // 1. robotun şaltterleri açıp kapatacak parmakları ( hafıza / register)
reg Commander_A;
reg Commander_B;
reg Commander_C;
  
  // 2. füzenin ateşlenip ateşlenmediğini izleyeceğimiz gözlem kablosu 
  wire Launch_Signal;
  
  //3. çipi masaya getir ve kabloları bağla (UUT - UNİT UNDER TEST ) 
  Tactical_Missile_Ignition UUT(
    .Commander_A(Commander_A),
    .Commander_B(Commander_B),
    .Commander_C(Commander_C),
    .Launch_Signal(Launch_Signal)
  );
  // Dalga forumunu (waveform) çizdirmek için gereken laboratuvar ayarı 
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_Tactical_Missile);
  end
  // TEST SENARYOSU (Robotun Hareket Planı)
    initial begin
        // Başlangıç: Kimse şaltere basmıyor (Durum 000)
        Commander_A = 0; Commander_B = 0; Commander_C = 0;
        #10; // "#10" komutu, 10 nanosaniye boyunca bekle ve sonucu gözlemle demektir.

        // Senaryo 1: Sadece C basıyor (Durum 001) - Ateşleme OLMAMALI
        Commander_A = 0; Commander_B = 0; Commander_C = 1;
        #10;

        // Senaryo 2: B ve C basıyor (Durum 011) - ATEŞLEME OLMALI!
        Commander_A = 0; Commander_B = 1; Commander_C = 1;
        #10;

        // Senaryo 3: A ve B basıyor (Durum 110) - ATEŞLEME OLMALI!
        Commander_A = 1; Commander_B = 1; Commander_C = 0;
        #10;

        // Senaryo 4: Bütün komutanlar basıyor (Durum 111) - ATEŞLEME OLMALI!
        Commander_A = 1; Commander_B = 1; Commander_C = 1;
        #10;

        $finish; // Testi bitir ve robotu durdur
    end
endmodule