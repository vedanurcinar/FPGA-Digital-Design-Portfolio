module tb_Sequential_Memory;
  //1ç robotun parmakları ve sinyal jeneratörü ( hafızalı girişler) 
  reg clk; // sistemin kalp atışı ( sinyal jeneratörü) 
  reg D; //  robotun veri göndereceği tuş 
  
  // 2. Çipin içindeki veriyi izleyeceğimiz kablo 
  wire Q; 
  
  //3. Çipi masaya getir ( Instantiation ) 
  D_Flip_Flop UUT(
    .clk(clk),
    .D(D),
    .Q(Q)
  );
//4. sinyal jeneratörü 
  // her 5 nanosaniyede bir clk sinyalinin durumu tersine çevir ( 0sa 1, 1se 0 yap) 
  // 0-1-0-1 şeklinde atan düzenli ritim oluşur 
  always #5 clk = ~clk;
  
  //5. Test laboratuvarı ayarları (waveform için)
  initial begin 
    $dumpfile("dump.vcd");
    $dumpvars(0, tb_Sequential_Memory);
  end
  
  //6. test senaryosu 
  initial begin 
    // başlangıç ayarları 
    clk=0; //sıfırdan başlat 
    D=0; // robot tuşa basmıyor 
    
    //biraz bekle , kalp ritmi otursun 
    #12;
    
    //senaryo 1 ; robot tuşa basıyor (D=1)
    D=1; 
    #10; // sistem 10 sn bıyunca bu veriyi izliyor 
    
    // senaryo 2 : robot elini tuştan çekiyor (D=0)
    D=0;
    #10;
    
    
    // senaryo 3 : ronot tekrar tuşa basıyor ( D=1)
    D=1;
    #10;
    $finish; // testi  bitir .
  end
endmodule 