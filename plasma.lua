

if string.sub(version, 1, 3) == '130' then
  GRS1.show()
else
  messageDialog('Plasma', 'Yeni sürümü indir <3', type, mbYes)
  closeCE()
end

function GRS1_CEEdit1Change(sender)
  if GRS1.CEEDit1.Text == plasmaKey() then
     isVerified86214213 = true
	 UDF1.Show()
     GRS1.Hide()
  end
end

function main_plasma_kiss()

  local processName = "javaw.exe"
  if processName == "javaw.exe" then
    openProcess(processName)
    local scan = createMemScan(UDF1.CEProgressbar1)
    local list = createFoundList(scan)

	if string.sub(maxRam, 1, 4) == '3072' then
	  scan.firstScan(1, 8, 0, "00 00 00 0? 00 00 00 ?? ?? ?? E2 ?? ?? ?? E3 ?? ?? ?? E? ?? ?? ?? ?? ?? ?? ?? E? 00 00 00 00 ?? ?? ?? ?? ?? ?? ?? ?? 0? 00 00 00 00 00 00 00 ?? ?? ?? F8", "", 0, 0xffffffffffffffff, "+W-C", 1, 1, true, false, false, false)
	end

    if string.sub(maxRam, 1, 4) == '8192' then
	  scan.firstScan(1, 8, 0, "00 00 00 0? 00 00 00 ?? ?? ?? BA ?? ?? ?? BB ?? ?? ?? B? ?? ?? ?? ?? ?? ?? ?? B? 00 00 00 00 ?? ?? ?? ?? ?? ?? ?? ?? ?? 00 00 00 00 00 00 00 ?? ?? ?? F8", "", 0, 0xffffffffffffffff, "+W-C", 1, 1, true, false, false, false)
	end

	if UDF1.CECheckbox1.Checked then
      pause()
    end
    scan.waitTillDone()
	if UDF1.CECheckbox1.Checked then
      unpause()
    end
    list.initialize()

    if list.getCount() == 1 then
	  if UDF1.CECheckbox3.Checked == false then
	    messageDialog("Plasma", "Hile aktif! Reach'i açmak-kaptamak için G'ye basılı tut.", type, mbYes)
	  end
	  UDF1.CELabel2.Caption = "Aktif!"
      local isReach = false

      local function loop(timer)
	    if isKeyOpen == true then
			if isKeyPressed(71) then
			  if isReach then
				isReach = false
				local bytes = readBytes(list.getAddress(0), 30, true)
				bytes[24] = bytes[24] - 4
				writeBytes(string.sub(string.format("%02x", (tonumber(list.getAddress(0), 16) + 23) * 256), 1, 9), bytes[24])
			  else
				isReach = true
				local bytes = readBytes(list.getAddress(0), 30, true)
				bytes[24] = bytes[24] + 4
				writeBytes(string.sub(string.format("%02x", (tonumber(list.getAddress(0), 16) + 23) * 256), 1, 9), bytes[24])
			  end
			end
			if isKeyPressed(72) then
			  UDF1.CELabel2.Caption = "Plasma."
			  if UDF1.CECheckbox3.Checked == false then
			    messageDialog("Plasma", "Reach tekrardan açılıyor...", type, mbYes)
			  end
			  timer.Enabled = false
			  main_plasma_kiss()
			end
		end
      end

      local timer = createTimer()
      timer.setInterval = 100
      timer.OnTimer = loop
      timer.Enabled = true
    else
      messageDialog("Plasma", "Hile açılırken sorun oldu! \n\n*SonOyuncu Launcher'dan MaxRam'i doğru ayarladığından emin ol! \n*Hileyi sunucuya girdikten sonra çalıştırdığından emin ol! \n*Hile yüklenirken hareket etmemen gerekiyor. \n*SonOyuncu'yu yeniden başlatmayı dene. \n\nSorun hala devam ederse bizimle iletişime geç.", type, mbYes)
	  UDF1.RadioButton1.Checked = false
    end
  else
    messageDialog("Plasma", "SonOyuncu tespit edilemedi!", type, mbYes)
  end

end

function UDF1_FormClose(sender)
  closeCE()
end

function GRS1_4_FormClose(sender)
  closeCE()
end

function UDF1_1_CEComboBox1Change(sender)
  maxRam = UDF1.CEComboBox1.Text
end

function UDF1_1_CEButton1Click(sender)
  os.execute("start https://discord.gg/rgA7V5SZxE")
end

function UDF1_1_CECheckbox2Change(sender)
  if UDF1.CECheckbox2.Checked == true then
    isKeyOpen = false
  else
    isKeyOpen = true
  end
end

function GRS1_4_CELabel4Click(sender)
  os.execute("start https://discord.gg/rgA7V5SZxE")
end

function UDF1_RadioButton1Change(sender)
  if UDF1.RadioButton1.Checked == true then
    if isVerified86214213 == true then
      main_plasma_kiss()
    else
      messageDialog("Plasma", "Sanırım Plasma'yı cracklemeye çalışıyorsun :')", type, mbYes)
      messageDialog("Plasma", "Anlıyorum, para vermek cazip gelmiyor...", type, mbYes)
      messageDialog("Plasma", "Halbuki plasma'yı ücretsiz bir şekilde kullanabileceğin kampanyalarımız bile var...", type, mbYes)
      messageDialog("Plasma", "İnan ki Plasma'yı yapmak için gerçekten çok çaba sarf ettik.", type, mbYes)
      messageDialog("Plasma", "Lütfen emeğe saygı duymayı öğren.", type, mbYes)
      closeCE()
    end
  end
end