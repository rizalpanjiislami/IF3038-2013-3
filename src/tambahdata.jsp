<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Untitled Document</title>

<script language="javascript">
function validasi(form){
  if (form.namatugas.value == "")
  {
    alert("Anda belum mengisikan Nama Tugas");
    form.namatugas.focus();
    return (false);
  }
  
  var namatugas = document.form.namatugas.value;
  var filter = /^.(?![._-].*|.*[._-]$)[\w.-]+ .+$/;
	if (!filter.test(namatugas)) {
	alert('Nama tidak boleh mengandung karakter asing');
	form.namatugas.focus;
	return false;
	}

var un = document.form.namatugas.value;
  un = un.length;
  if(un>25)
  {
	    alert ("Panjang nama tugas maksimal 25 karakter");
		form.namatugas.focus();
		return (false);
  } 

var ext = document.form[0][attachment[0]].value;
  ext = ext.substring(ext.length-3,ext.length);
  ext = ext.toLowerCase();
  if ((ext != 'jpg')&&(ext != 'jpeg')&&(ext != 'docx')&&(ext != 'pdf')&&(ext != 'zip')&&(ext != 'rar')&&(ext != 'wmv')&&(ext != 'flv'))
  {
	  	alert ("Format ekstensi harus JPG, JPEG, DOCX, PDF, ZIP, RAR, WMV, FLV");
		return (false);
  }
  
  return true;
}
  </script>

<script language="JavaScript" type="text/JavaScript">
counter = 0;
function action()
{
counterNext = counter + 1;
document.getElementById("input1"+counter).innerHTML="<p><input type='file' name='attachment[]'></p><div id=\"input1"+counterNext+"\"></div>";
//document.getElementById("input1"+counter).innerHTML = "<p>Lampiran : <input type='file' name='dokumen[]'></p><div id=\"input1"+counterNext+"\"></div>";
counter++;
}
</script>

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

<style type="text/css">
.plain {height:20px; vertical-align:middle;}
</style>

</head>

<body>

<?php
$kategori = $_GET['kategori'];
?>

<form id="form" enctype="multipart/form-data" name="form" method="post" action="tambahdatatahap2.php" onSubmit="return validasi(this)">
  <div align="center">
    <p>&nbsp;</p>
    <table width="100%" border="0" class="tabelkeren">
      <tr>
        <td colspan="2" scope="col"><div align="center"><strong>TAMBAH TUGAS BARU</strong></div>                        
      </tr>
      <tr>
        <td width="26%" scope="col"><div align="left"><strong>Nama Tugas</strong></div>
          <strong>
          </th>
          </strong>
        <td width="74%" scope="col"><label for="namatugas"></label>
          <div align="center">
            <input name="namatugas" type="text" id="namatugas" size="60" />
        </div></th>
      </tr>
      <tr>
        <td><div align="left"><strong>Attachment</strong></div>
          <strong>
          </th>
          </strong>
        <td><div align="left">
          <input type="file" name="attachment[]"/>
          <div id="input10"></div>
          <a href="javascript:action();">Tambah</a>
        </div></td>
      </tr>
      <tr>
        <td><div align="left"><strong>Deadline</strong></div>
          <strong>
          </th>
          </strong>
        <td><div align="left">
                                  <input class="plain" value="" size="11" name="deadline" id="deadline"> <a href="javascript:void(0)" onClick="if(self.gfPop)gfPop.fPopCalendar(document.form.deadline);return false;" ><img name="popcal" align="absmiddle" src="calbtn.gif" width="34" height="22" border="0" alt=""></a>
                                  <iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
</iframe>
                                  </div></td>
      </tr>
      <tr>
        <td><div align="left"><strong>Assigne</strong></div>
          <strong>
          </th>
          </strong>
        <td><div align="center">
        <input name="assigne" type="hidden" id="assigne" value="" />
          
          <ul id="singleFieldTags"></ul>
        </div></td>
      </tr>
      <tr>
        <td height="40"><div align="left"><strong>Tag </strong></div></td>
        <td><div align="left">
          <input name="tag" type="hidden" id="tag" value="" />
        </div>
          <ul id="singleFieldTags2">
          </ul></td>
      </tr>
    </table>
    <p>
      <label for="kategori"></label>
      <input name="kategori" type="hidden" id="kategori" value="<?php echo $kategori; ?>" />
    </p>
    <p>
      <input type="submit" name="Tambah Tugas" id="Tambah Tugas" value="Tambah Tugas"/>
    </p>
  </div>
</form>
</body>
</html>