<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>
</head>
<link rel="stylesheet" type="text/css" href="http://m.tiket.com/min/f=assets/css/style.css" /> 
<style>
/* Line 1 */
body, button, input, select, textarea
{
  font-family: sans-serif;
  color: #222222;
}

/* Line 7 */
button, input, select, textarea
{
  font-size: 1em;
  margin-top: 0px;
  margin-right: 0px;
  margin-bottom: 0px;
  margin-left: 0px;
  vertical-align: baseline;
}

/* Line 59 */
.search input[type="text"], .search input[type="search"], .search select
{
  border-top-left-radius: 5px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
  border-bottom-left-radius: 5px;
  box-shadow: #eaedef;
  border-top-width: 1px;
  border-right-width-value: 1px;
  border-bottom-width: 1px;
  border-left-width-value: 1px;
  border-top-style: solid;
  border-right-style-value: solid;
  border-bottom-style: solid;
  border-left-style-value: solid;
  border-top-color: #cbd3db;
  border-right-color-value: #cbd3db;
  border-bottom-color: #cbd3db;
  border-left-color-value: #cbd3db;
  border-image-source: none;
  border-image-slice: 100% 100% 100% 100%;
  border-image-width: 1 1 1 1;
  border-image-outset: 0 0 0 0;
  border-image-repeat: stretch stretch;
  padding-top: 4px;
  padding-right: 5px;
  padding-bottom: 4px;
  padding-left: 5px;
  margin-top: 0px;
  margin-right: 0px;
  margin-bottom: 10px;
  margin-left: 0px;
  width: 100%;
}

/* Line 70 */
.search #monthIn, .search #monthOut
{
  width: 68%;
  margin-top: 0px;
  margin-right: 0px;
  margin-bottom: 10px;
  margin-left: 0px;
}

.clearfix
{
}

.search .wrap2Col
{
  width: 100%;
  position: relative;
  padding-top: 5px;
}

/* Line 77 */
.search input[type="submit"]
{
  width: 250px;
  margin-top: 10px;
  margin-right: 0px;
  margin-bottom: 0px;
  margin-left: 0px;
  background-color: #60a112;
  background-repeat: repeat;
  background-attachment: scroll;
  background-position: 0% 0%;
  background-clip: border-box;
  background-origin: padding-box;
  background-size: auto auto;
  background-image: #92c21d;
  border-top-left-radius: 7px;
  border-top-right-radius: 7px;
  border-bottom-right-radius: 7px;
  border-bottom-left-radius: 7px;
  box-shadow: 0px 1px 0px rgba(255, 255, 255, 0.3), 0px 1px 0px rgba(255, 255, 255, 0.3) inset;
  text-shadow: 1px 1px 0px rgba(51, 51, 51, 0.3);
  border-top-width: 1px;
  border-right-width-value: 1px;
  border-bottom-width: 1px;
  border-left-width-value: 1px;
  border-top-style: solid;
  border-right-style-value: solid;
  border-bottom-style: solid;
  border-left-style-value: solid;
  border-top-color: #547c18;
  border-right-color-value: #547c18;
  border-bottom-color: #547c18;
  border-left-color-value: #547c18;
  border-image-source: none;
  border-image-slice: 100% 100% 100% 100%;
  border-image-width: 1 1 1 1;
  border-image-outset: 0 0 0 0;
  border-image-repeat: stretch stretch;
  font-size: 14px;
  font-weight: bold;
  padding-top: 5px;
  padding-right: 13px;
  padding-bottom: 5px;
  padding-left: 13px;
  color: white;
}

/* Line 80 */
.search input[type="submit"]:hover
{
  background-color: #52c716;
  background-repeat: repeat;
  background-attachment: scroll;
  background-position: 0% 0%;
  background-clip: border-box;
  background-origin: padding-box;
  background-size: auto auto;
  background-image: #7de037;
}
</style>

<body>
<div class="search">
<form action="http://m.tiket.com/flight/mobiFlight" method="get">
  <fieldset>
    <h3>Tujuan?</h3>
    <p>
      <label>
        <input type="radio" name="typeflight" id="oneway" value="oneway" onchange="checkTrip()" />
        Sekali Jalan</label>
      <label>
        <input type="radio" name="typeflight" id="roundtrip" value="roundtrip" onchange="checkTrip()" checked="checked" />
        Pulang Pergi </label>
    </p>
  </fieldset>
  <fieldset>
    <p>
      <label for="from">Dari</label>
      <br />
      <select name="d" id="from">
        <option value="AMQ" >Ambon (AMQ)</option>
        <option value="BJW" >Bajawa (BJW)</option>
        <option value="BPN" >BalikPapan (BPN)</option>
        <option value="BTJ" >Banda Aceh (BTJ)</option>
        <option value="BDO" >Bandung (BDO)</option>
        <option value="BDJ" >Banjarmasin (BDJ)</option>
        <option value="DQJ" >Banyuwangi (DQJ)</option>
        <option value="BTH" >Batam (BTH)</option>
        <option value="BUW" >Baubau (BUW)</option>
        <option value="BKS" >Bengkulu (BKS)</option>
        <option value="BEJ" >Berau (BEJ)</option>
        <option value="BIK" >Biak (BIK)</option>
        <option value="BMU" >Bima (BMU)</option>
        <option value="WUB" >Buli (WUB)</option>
        <option value="UOL" >Buol (UOL)</option>
        <option value="DPS" >Denpasar, Bali (DPS)</option>
        <option value="ENE" >Ende (ENE)</option>
        <option value="FKQ" >FakFak (FKQ)</option>
        <option value="GTO" >Gorontalo (GTO)</option>
        <option value="GNS" >GunungSitoli (GNS)</option>
        <option value="CGK" selected="selected">Jakarta (CGK)</option>
        <option value="DJB" >Jambi (DJB)</option>
        <option value="DJJ" >Jayapura (DJJ)</option>
        <option value="KNG" >Kaimana (KNG)</option>
        <option value="KDI" >Kendari (KDI)</option>
        <option value="KBU" >Kotabaru (KBU)</option>
        <option value="KOE" >Kupang (KOE)</option>
        <option value="LBJ" >LabuanBajo (LBJ)</option>
        <option value="LAH" >Labuha (LAH)</option>
        <option value="TKG" >Lampung (TKG)</option>
        <option value="LSW" >Lhokseumawe (LSW)</option>
        <option value="LOP" >Lombok, Mataram (LOP)</option>
        <option value="LUW" >Luwuk (LUW)</option>
        <option value="MLG" >Malang (MLG)</option>
        <option value="MJU" >Mamuju (MJU)</option>
        <option value="MDC" >Manado (MDC)</option>
        <option value="MKW" >Manokwari (MKW)</option>
        <option value="AMI" >Mataram (AMI)</option>
        <option value="MOF" >Maumere (MOF)</option>
        <option value="MES" >Medan (MES)</option>
        <option value="MNA" >Melanguane (MNA)</option>
        <option value="MKQ" >Merauke (MKQ)</option>
        <option value="MEQ" >Meulaboh (MEQ)</option>
        <option value="NBX" >Nabire (NBX)</option>
        <option value="NTX" >NatunaRanai (NTX)</option>
        <option value="PDG" >Padang (PDG)</option>
        <option value="PKY" >Palangka raya (PKY)</option>
        <option value="PLM" >Palembang (PLM)</option>
        <option value="PLW" >Palu (PLW)</option>
        <option value="PGK" >Pangkal pinang (PGK)</option>
        <option value="PKU" >Pekanbaru (PKU)</option>
        <option value="PUM" >Pomalaa (PUM)</option>
        <option value="PNK" >Pontianak (PNK)</option>
        <option value="PSJ" >Poso (PSJ)</option>
        <option value="ARD" >Pulau Alor (ARD)</option>
        <option value="RTG" >Ruteng (RTG)</option>
        <option value="SMQ" >Sampit (SMQ)</option>
        <option value="SRG" >Semarang (SRG)</option>
        <option value="AEG" >Sibolga (AEG)</option>
        <option value="DTB" >Silangit (DTB)</option>
        <option value="SNX" >Sinabang (SNX)</option>
        <option value="SIN" >Singapore (SIN)</option>
        <option value="SOC" >Solo (SOC)</option>
        <option value="SOQ" >Sorong (SOQ)</option>
        <option value="SOQ" >Sorong (SOQ)</option>
        <option value="SWQ" >Sumbawa (SWQ)</option>
        <option value="SUB" >Surabaya (SUB)</option>
        <option value="NAH" >Tahuna (NAH)</option>
        <option value="TMC" >Tambolaka (TMC)</option>
        <option value="TJQ" >Tanjung Pandan (TJQ)</option>
        <option value="TNJ" >Tanjung Pinang (TNJ)</option>
        <option value="TRK" >Tarakan (TRK)</option>
        <option value="TTE" >Ternate (TTE)</option>
        <option value="TIM" >Timika (TIM)</option>
        <option value="KAZ" >Tobelo (KAZ)</option>
        <option value="LUV" >Tual (LUV)</option>
        <option value="UPG" >UjungPandang, Makassar (UPG)</option>
        <option value="WGP" >Waingapu (WGP)</option>
        <option value="WGI" >Wangi wangi (WGI)</option>
        <option value="JOG" >Yogyakarta (JOG)</option>
      </select>
    </p>
    <p>
      <label for="to">Ke</label>
      <br />
      <select name="a" id="to">
        <option value="AMQ" >Ambon (AMQ)</option>
        <option value="BJW" >Bajawa (BJW)</option>
        <option value="BPN" >BalikPapan (BPN)</option>
        <option value="BTJ" >Banda Aceh (BTJ)</option>
        <option value="BDO" >Bandung (BDO)</option>
        <option value="BDJ" >Banjarmasin (BDJ)</option>
        <option value="DQJ" >Banyuwangi (DQJ)</option>
        <option value="BTH" >Batam (BTH)</option>
        <option value="BUW" >Baubau (BUW)</option>
        <option value="BKS" >Bengkulu (BKS)</option>
        <option value="BEJ" >Berau (BEJ)</option>
        <option value="BIK" >Biak (BIK)</option>
        <option value="BMU" >Bima (BMU)</option>
        <option value="WUB" >Buli (WUB)</option>
        <option value="UOL" >Buol (UOL)</option>
        <option value="DPS" selected="selected">Denpasar, Bali (DPS)</option>
        <option value="ENE" >Ende (ENE)</option>
        <option value="FKQ" >FakFak (FKQ)</option>
        <option value="GTO" >Gorontalo (GTO)</option>
        <option value="GNS" >GunungSitoli (GNS)</option>
        <option value="CGK" >Jakarta (CGK)</option>
        <option value="DJB" >Jambi (DJB)</option>
        <option value="DJJ" >Jayapura (DJJ)</option>
        <option value="KNG" >Kaimana (KNG)</option>
        <option value="KDI" >Kendari (KDI)</option>
        <option value="KBU" >Kotabaru (KBU)</option>
        <option value="KOE" >Kupang (KOE)</option>
        <option value="LBJ" >LabuanBajo (LBJ)</option>
        <option value="LAH" >Labuha (LAH)</option>
        <option value="TKG" >Lampung (TKG)</option>
        <option value="LSW" >Lhokseumawe (LSW)</option>
        <option value="LOP" >Lombok, Mataram (LOP)</option>
        <option value="LUW" >Luwuk (LUW)</option>
        <option value="MLG" >Malang (MLG)</option>
        <option value="MJU" >Mamuju (MJU)</option>
        <option value="MDC" >Manado (MDC)</option>
        <option value="MKW" >Manokwari (MKW)</option>
        <option value="AMI" >Mataram (AMI)</option>
        <option value="MOF" >Maumere (MOF)</option>
        <option value="MES" >Medan (MES)</option>
        <option value="MNA" >Melanguane (MNA)</option>
        <option value="MKQ" >Merauke (MKQ)</option>
        <option value="MEQ" >Meulaboh (MEQ)</option>
        <option value="NBX" >Nabire (NBX)</option>
        <option value="NTX" >NatunaRanai (NTX)</option>
        <option value="PDG" >Padang (PDG)</option>
        <option value="PKY" >Palangka raya (PKY)</option>
        <option value="PLM" >Palembang (PLM)</option>
        <option value="PLW" >Palu (PLW)</option>
        <option value="PGK" >Pangkal pinang (PGK)</option>
        <option value="PKU" >Pekanbaru (PKU)</option>
        <option value="PUM" >Pomalaa (PUM)</option>
        <option value="PNK" >Pontianak (PNK)</option>
        <option value="PSJ" >Poso (PSJ)</option>
        <option value="ARD" >Pulau Alor (ARD)</option>
        <option value="RTG" >Ruteng (RTG)</option>
        <option value="SMQ" >Sampit (SMQ)</option>
        <option value="SRG" >Semarang (SRG)</option>
        <option value="AEG" >Sibolga (AEG)</option>
        <option value="DTB" >Silangit (DTB)</option>
        <option value="SNX" >Sinabang (SNX)</option>
        <option value="SIN" >Singapore (SIN)</option>
        <option value="SOC" >Solo (SOC)</option>
        <option value="SOQ" >Sorong (SOQ)</option>
        <option value="SOQ" >Sorong (SOQ)</option>
        <option value="SWQ" >Sumbawa (SWQ)</option>
        <option value="SUB" >Surabaya (SUB)</option>
        <option value="NAH" >Tahuna (NAH)</option>
        <option value="TMC" >Tambolaka (TMC)</option>
        <option value="TJQ" >Tanjung Pandan (TJQ)</option>
        <option value="TNJ" >Tanjung Pinang (TNJ)</option>
        <option value="TRK" >Tarakan (TRK)</option>
        <option value="TTE" >Ternate (TTE)</option>
        <option value="TIM" >Timika (TIM)</option>
        <option value="KAZ" >Tobelo (KAZ)</option>
        <option value="LUV" >Tual (LUV)</option>
        <option value="UPG" >UjungPandang, Makassar (UPG)</option>
        <option value="WGP" >Waingapu (WGP)</option>
        <option value="WGI" >Wangi wangi (WGI)</option>
        <option value="JOG" >Yogyakarta (JOG)</option>
      </select>
    </p>
  </fieldset>
  <fieldset>
    <h3>Kapan?</h3>
    <div>
      <label for="dateIn">Pergi</label>
      <div class="wrap2Col clearfix">
        <select name="day" id="dateIn" tabindex="3">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22" selected="selected">22</option>
          <option value="23">23</option>
          <option value="24">24</option>
          <option value="25">25</option>
          <option value="26">26</option>
          <option value="27">27</option>
          <option value="28">28</option>
          <option value="29">29</option>
          <option value="30">30</option>
          <option value="31">31</option>
        </select>
        <select name="monthyear" id="monthIn" tabindex="4">
          <option value="2012-12" selected="selected">Desember 2012</option>
          <option value="2013-01">Januari 2013</option>
          <option value="2013-02">Pebruari 2013</option>
          <option value="2013-03">Maret 2013</option>
          <option value="2013-04">April 2013</option>
          <option value="2013-05">Mei 2013</option>
          <option value="2013-06">Juni 2013</option>
          <option value="2013-07">Juli 2013</option>
          <option value="2013-08">Agustus 2013</option>
          <option value="2013-09">September 2013</option>
          <option value="2013-10">Oktober 2013</option>
          <option value="2013-11">November 2013</option>
        </select>
      </div>
    </div>
    <div id="contReturning">
      <label for="dateOut">Pulang</label>
      <div class="wrap2Col clearfix">
        <select name="ret_day" id="dateOut" tabindex="5">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22">22</option>
          <option value="23">23</option>
          <option value="24">24</option>
          <option value="25">25</option>
          <option value="26">26</option>
          <option value="27">27</option>
          <option value="28">28</option>
          <option value="29" selected="selected">29</option>
          <option value="30">30</option>
          <option value="31">31</option>
        </select>
        <select name="ret_monthyear" id="monthOut" tabindex="6">
          <option value="2012-12" selected="selected">Desember 2012</option>
          <option value="2013-01">Januari 2013</option>
          <option value="2013-02">Pebruari 2013</option>
          <option value="2013-03">Maret 2013</option>
          <option value="2013-04">April 2013</option>
          <option value="2013-05">Mei 2013</option>
          <option value="2013-06">Juni 2013</option>
          <option value="2013-07">Juli 2013</option>
          <option value="2013-08">Agustus 2013</option>
          <option value="2013-09">September 2013</option>
          <option value="2013-10">Oktober 2013</option>
          <option value="2013-11">November 2013</option>
        </select>
      </div>
    </div>
  </fieldset>
  <fieldset>
    <h3>Berapa Orang?</h3>
    <div class="wrap3Col clearfix">
      <p class="adult">
        <label for="adults">Dewasa (12+)</label>
        <br />
        <select name="adult" id="adults" tabindex="7">
          <option value="1" selected="selected">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
        </select>
      </p>
      <p class="child">
        <label for="childs"> Anak (2-12)</label>
        <br />
        <select name="child" id="childs" tabindex="8">
          <option value="0" selected="selected">0</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
        </select>
      </p>
      <p class="infant">
        <label for="infants">Bayi (&lt;2)</label>
        <br />
        <select name="infant" id="infants" tabindex="9">
          <option value="0" selected="selected">0</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
        </select>
      </p>
    </div>
    
    <div class="search">
    <input type="submit" value="Cari Sekarang" tabindex="10" />
    <input type="submit" value="Cari Sekarang" tabindex="10" />
    </div>
  </fieldset>
</form>
</div>
</body>
</html>
