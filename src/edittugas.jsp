<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

    <link href="css/jquery.tagit.css" rel="stylesheet" type="text/css">
    <link href="css/tagit.ui-zendesk.css" rel="stylesheet" type="text/css">
 
    <script src="ajax/a-1.js" type="text/javascript" charset="utf-8"></script>
    <script src="ajax/a-2.js" type="text/javascript" charset="utf-8"></script>

    <!-- The real deal -->
    <script src="js/tag-it.js" type="text/javascript" charset="utf-8"></script>

    <script>
        $(function(){                   
			
            var sampleTags = ['rizal', 'oka', 'dwitri'];

            //-------------------------------
            // Single field
            //-------------------------------
			
            $('#singleFieldTags').tagit({
                availableTags: sampleTags,
                // This will make Tag-it submit a single form value, as a comma-delimited field.
                singleField: true,
                singleFieldNode: $('#assigne')
            });

            //-------------------------------
            // Tag events
            //-------------------------------
            var eventTags = $('#eventTags');

            var addEvent = function(text) {
                $('#events_container').append(text + '<br>');
            };

            eventTags.tagit({
                availableTags: sampleTags,
                beforeTagAdded: function(evt, ui) {
                    if (!ui.duringInitialization) {
                        addEvent('beforeTagAdded: ' + eventTags.tagit('tagLabel', ui.tag));
                    }
                },
                afterTagAdded: function(evt, ui) {
                    if (!ui.duringInitialization) {
                        addEvent('afterTagAdded: ' + eventTags.tagit('tagLabel', ui.tag));
                    }
                },
                beforeTagRemoved: function(evt, ui) {
                    addEvent('beforeTagRemoved: ' + eventTags.tagit('tagLabel', ui.tag));
                },
                afterTagRemoved: function(evt, ui) {
                    addEvent('afterTagRemoved: ' + eventTags.tagit('tagLabel', ui.tag));
                },
                onTagClicked: function(evt, ui) {
                    addEvent('onTagClicked: ' + eventTags.tagit('tagLabel', ui.tag));
                },
                onTagExists: function(evt, ui) {
                    addEvent('onTagExists: ' + eventTags.tagit('tagLabel', ui.existingTag));
                }
            });

            //-------------------------------
            // Read-only
            //-------------------------------
            $('#readOnlyTags').tagit({
                readOnly: true
            });

            //-------------------------------
            // Tag-it methods
            //-------------------------------
            $('#methodTags').tagit({
                availableTags: sampleTags
            });

            //-------------------------------
            // Allow spaces without quotes.
            //-------------------------------
            $('#allowSpacesTags').tagit({
                availableTags: sampleTags,
                allowSpaces: true
            });

            //-------------------------------
            // Remove confirmation
            //-------------------------------
            $('#removeConfirmationTags').tagit({
                availableTags: sampleTags,
                removeConfirmation: true
            });
            
        });
    </script>

<script>
        $(function(){                   
			
            var sampleTags = ['kuliah', 'bisnis', 'sem6' , 'tubes'];

            //-------------------------------
            // Single field
            //-------------------------------
			
            $('#singleFieldTags2').tagit({
                availableTags: sampleTags,
                // This will make Tag-it submit a single form value, as a comma-delimited field.
                singleField: true,
                singleFieldNode: $('#tag')
            });

            //-------------------------------
            // Tag events
            //-------------------------------
            var eventTags = $('#eventTags');

            var addEvent = function(text) {
                $('#events_container').append(text + '<br>');
            };

            eventTags.tagit({
                availableTags: sampleTags,
                beforeTagAdded: function(evt, ui) {
                    if (!ui.duringInitialization) {
                        addEvent('beforeTagAdded: ' + eventTags.tagit('tagLabel', ui.tag));
                    }
                },
                afterTagAdded: function(evt, ui) {
                    if (!ui.duringInitialization) {
                        addEvent('afterTagAdded: ' + eventTags.tagit('tagLabel', ui.tag));
                    }
                },
                beforeTagRemoved: function(evt, ui) {
                    addEvent('beforeTagRemoved: ' + eventTags.tagit('tagLabel', ui.tag));
                },
                afterTagRemoved: function(evt, ui) {
                    addEvent('afterTagRemoved: ' + eventTags.tagit('tagLabel', ui.tag));
                },
                onTagClicked: function(evt, ui) {
                    addEvent('onTagClicked: ' + eventTags.tagit('tagLabel', ui.tag));
                },
                onTagExists: function(evt, ui) {
                    addEvent('onTagExists: ' + eventTags.tagit('tagLabel', ui.existingTag));
                }
            });

            //-------------------------------
            // Read-only
            //-------------------------------
            $('#readOnlyTags').tagit({
                readOnly: true
            });

            //-------------------------------
            // Tag-it methods
            //-------------------------------
            $('#methodTags').tagit({
                availableTags: sampleTags
            });

            //-------------------------------
            // Allow spaces without quotes.
            //-------------------------------
            $('#allowSpacesTags').tagit({
                availableTags: sampleTags,
                allowSpaces: true
            });

            //-------------------------------
            // Remove confirmation
            //-------------------------------
            $('#removeConfirmationTags').tagit({
                availableTags: sampleTags,
                removeConfirmation: true
            });
            
        });
    </script>

</head>

<?php
	include "koneksi.php";
	
	$kodetugas = $_GET['kodetugas'];
	$kodeuser = $_GET['kodeuserasal'];
	
	$data  = mysql_query("SELECT * FROM tugas WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");
	$data2 = mysql_query("SELECT * FROM assigne WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");
	$data3 = mysql_query("SELECT * FROM tag WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");
	$data4 = mysql_query("SELECT * FROM komentar WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas' ORDER BY tanggal,waktu");
?>

<body>
<div class="corner_inner">
  <div id="main_body">
    <p align="center">
      <?php
			$baris = mysql_fetch_array($data);
		?>
    </p>
    <div align="center">
      <form id="form1" name="form1" method="post" action="edittugastahap2.php">
        <p>&nbsp;</p>
        <table width="70%" border="1" class="tabelkeren">
          <tr bgcolor="#0099CC">
            <th height="34" colspan="2" scope="col">RINCIAN TUGAS</th>
          </tr>
          <tr>
            <td width="27%" height="40"><div align="left"><strong>Nama Tugas </strong></div></td>
            <td width="73%"><div align="left"><?php echo $baris['namatugas'];?></div></td>
          </tr>
          <tr>
            <td height="40"><div align="left"><strong>Status Tugas</strong></div></td>
            <td><div align="left">
              <?php 
		  
		  	  if($baris['statustugas']==1)
			  {
				  echo "Tugas Belum Selesai";
			  }
			  else
			  {
				  echo "Tugas Sudah Selesai";
			  }
		  
		  ?>
            </div></td>
          </tr>
          <tr>
            <td height="40"><div align="left"><strong>Attachment </strong></div></td>
            <td><div align="left">
              <p>
                <?php 
				$data5 = mysql_query("SELECT * FROM attachment WHERE kodeuser='$kodeuser' AND kodetugas='$kodetugas'");
				
				while($baris2 = mysql_fetch_array($data5))
				{
					$alamat = $baris2['alamat'];
					$panjang = strlen($alamat);
					
					if($alamat[$panjang-4]!=".")
					{
						$ekstensi = $alamat[$panjang-4].$alamat[$panjang-3].$alamat[$panjang-2].$alamat[$panjang-1];
					}
					else
					{
						$ekstensi = $alamat[$panjang-3].$alamat[$panjang-2].$alamat[$panjang-1];
					}
					
					if(($ekstensi == "jpeg")||($ekstensi == "jpg"))
					{
						?>
                <img src="<?php echo $baris2['alamat'];?>" alt="" width="300" height="300" /> <br />
                <br />
                <?php
					}
					else
					if($ekstensi == "mp4")
					{
						?>
                <video width="300" height="300" controls>
                  <source src="<?php echo $baris['alamat'];?>" type="video/mp4">
                  <br />
                  <br />
                </video>
                <?php
					}
					else
					{
						?>
                <a href="<?php echo $baris2['alamat'];?>" target="_blank"> <?php echo $baris2['alamat'];?></a> <br />
                <br />
                <?php
					}
				}
			?>
              </p>
            </div></td>
          </tr>
          <tr>
            <td height="40"><div align="left"><strong>Deadline </strong></div></td>
            <td><div align="left">
              <label for="deadline"></label>
              <input name="deadline" type="text" id="deadline" value="<?php echo $baris['deadline'];?>" />
            </div></td>
          </tr>
          <tr>
            <td height="40"><div align="left"><strong>Assigne </strong></div></td>
            <td><div align="left">
              <?php 
			$assigne = "";
						
									while($baris2=mysql_fetch_array($data2))
									{
										if($assigne!="")
										{
											$assigne=$assigne.",";
										}
										$dumkod = $baris2['assigne'];
										$dummy = mysql_query("SELECT * FROM user WHERE kodeuser='$dumkod'");
										$dumdata = mysql_fetch_array($dummy);
										$assigne =  $assigne.$dumdata['username'];
									}
								  ?>
              <input name="assigne" type="hidden" id="assigne" value="<?php echo $assigne; ?>" />
          
          <ul id="singleFieldTags"></ul>
            </div></td>
          </tr>
          <tr>
            <td height="40"><div align="left"><strong>Komentar </strong></div></td>
            <td><div align="left">
              <?php
                                    while($baris4=mysql_fetch_array($data4))
									{
										$dumkod = $baris4['kodeuserkomentar'];
										$dummy = mysql_query("SELECT * FROM user WHERE kodeuser='$dumkod'");
										$dumdata = mysql_fetch_array($dummy);
										echo "<p>".$dumdata['username']." : ".$baris4['komentar']." (".$baris4['tanggal']."-".$baris4['waktu'].")"."</p>";
									}
									?>
            </div></td>
          </tr>
          <tr>
            <td height="40"><div align="left"><strong>Tag </strong></div></td>
            <td><div align="left">
              <?php              
			$tag = "";                    	  
                                        while($baris3=mysql_fetch_array($data3))
                                        {
											if($tag!="")
											{
												$tag=$tag.",";
											}
                                            $tag = $tag.$baris3['tag'];
                                        }
									  ?>
              <input name="tag" type="hidden" id="tag" value="<?php echo $tag; ?>" />
              
            </div>
            
            <ul id="singleFieldTags2"></ul>
            
            </td>
          </tr>
        </table>
        <p>
          <label for="kodetugas"></label>
          <input name="kodetugaslama" type="hidden" id="kodetugaslama" value="<?php echo $kodetugas; ?>" />
          <input name="kodeuserlama" type="hidden" id="kodeuserlama" value="<?php echo $kodeuser; ?>" />
        </p>
        <p>
          <input type="submit" name="edit" id="edit" value="Simpan" />
        </p>
      </form>
      <p>
        </p>
    </p>
    </div>
    <p align="center">&nbsp;
    </p>
    <p align="center"><a href="hapustugas.php?kodetugas=<?php echo $kodetugas; ?>&kodeuser=<?php echo $kodeuser; ?>"> <input type="submit" name="hapus" id="hapus" value="Hapus"/> 
    </a> </p>
<p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <table cellpadding="0" cellspacing="0" align="center">
      <tr>
        <td valign="top"><div>
          <table class="contentpaneopen" align="center">
            <tr>
              <td valign="top" colspan="2"></td>
            </tr>
          </table></td>
      </tr>
    </table>
  </div>
</div>
</body>
</html>