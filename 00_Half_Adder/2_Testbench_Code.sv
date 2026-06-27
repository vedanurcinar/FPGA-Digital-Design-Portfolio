module tb_Half_Adder;

    // Laboratuvardaki test kablolarımız
    reg test_A;
    reg test_B;
    wire test_Sum;
    wire test_Carry;

    // Ürettiğimiz çipi test masasına bağlıyoruz
    Half_Adder uut (
        .A(test_A),
        .B(test_B),
        .Sum(test_Sum),
        .Carry(test_Carry)
    );

    // Düğmelere basıp elektrik verdiğimiz kısım
    initial begin
        // Sinyal ekranını açmak için zorunlu komutlar
        $dumpfile("dump.vcd");
        $dumpvars(1, tb_Half_Adder);

        // 1. Durum: İki kabloda da elektrik yok (0 + 0)
        test_A = 0; test_B = 0;
        #10; // 10 nanosaniye bekle, elektrik yerine otursun

        // 2. Durum: Sadece B kablosunda elektrik var (0 + 1)
        test_A = 0; test_B = 1;
        #10; 

        // 3. Durum: Sadece A kablosunda elektrik var (1 + 0)
        test_A = 1; test_B = 0;
        #10; 

        // 4. Durum: İki kabloda da elektrik var (1 + 1)
        test_A = 1; test_B = 1;
        #10; 

        // Test bitti, laboratuvarı kapat
        $finish;
    end

endmodule