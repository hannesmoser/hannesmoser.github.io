WWWROOT=http://theinf1.informatik.uni-jena.de/~moser/

getentry () {
  GEKEY=$1
  GEENTRY=$2
  if ! [ -e $GEKEY.def ]; then
    echoerr ERROR: $GEKEY does not exist.
    exit 1
  fi
  cat $GEKEY.def | grep "^$GEENTRY:" | sed "s/^$GEENTRY: //" | sed "s/^$GEENTRY://"
}

existsentry () {
  GEKEY=$1
  GEENTRY=$2
  if ! [ -e $GEKEY.def ]; then
    echoerr ERROR: $GEKEY does not exist.
    exit 1
  fi
  cat $GEKEY.def | grep "^$GEENTRY:" >/dev/null 
}

makepubentry () {
  KEY=$1
  cat << EOF
          <tr valign="top">
            <td width="165" align="right" class="autores">
EOF
  AUTHOR=$(getentry $KEY AUTHOR)
  for AUTHORKEY in $AUTHOR; do
    if existsentry $AUTHORKEY HP; then
       echo "<a href=\"$(getentry $AUTHORKEY HP)\">$(getentry $AUTHORKEY NAME)</a>"
    else
      getentry $AUTHORKEY NAME
    fi
    echo "<br>"
  done
    echo "<span class=\"texto\">"
    if existsentry $KEY PDF; then 
      echo "<a href="                                                   
      echo "\"$(getentry $KEY PDF)\""                                  
      echo "onmouseout=\"MM_swapImgRestore()\" onmouseover="           
      echo "\"MM_swapImage('Image${KEY}PDF','','pdf_2.jpg',1)\"><img src="    
      echo "\"pdf_1.jpg\" name=\"Image${KEY}PDF\" alt=\"[PDF]\" width=\"29\" height=\"29\"" 
      echo "border=\"0\" id=\"Image${KEY}PDF\"></a>"                     
    fi
    if existsentry $KEY DOI; then 
      echo "<a href="                                                   
      echo "\"http://dx.doi.org/$(getentry $KEY DOI)\""                                  
      echo "onmouseout=\"MM_swapImgRestore()\" onmouseover="           
      echo "\"MM_swapImage('Image${KEY}DOI','','doi_2.jpg',1)\"><img src="    
      echo "\"doi_1.jpg\" name=\"Image${KEY}DOI\" alt=\"[DOI]\" width=\"29\" height=\"29\"" 
      echo "border=\"0\" id=\"Image${KEY}DOI\"></a>"                     
    fi
    if existsentry $KEY LINK; then 
      echo "<a href="                                                   
      echo "\"$(getentry $KEY LINK)\""                                  
      echo "onmouseout=\"MM_swapImgRestore()\" onmouseover="           
      echo "\"MM_swapImage('Image${KEY}LINK','','doi_2.jpg',1)\"><img src="    
      echo "\"doi_1.jpg\" name=\"Image${KEY}LINK\" alt=\"[LINK]\" width=\"29\" height=\"29\"" 
      echo "border=\"0\" id=\"Image${KEY}LINK\"></a>"                     
    fi
    if existsentry $KEY TALK; then 
      echo "<a href="                                                   
      echo "\"$(getentry $KEY TALK)\""                                  
      echo "onmouseout=\"MM_swapImgRestore()\" onmouseover="           
      echo "\"MM_swapImage('Image${KEY}TALK','','talk_2.jpg',1)\"><img src="    
      echo "\"talk_1.jpg\" name=\"Image${KEY}TALK\" alt=\"[TALK]\" width=\"29\" height=\"29\"" 
      echo "border=\"0\" id=\"Image${KEY}TALK\"></a>"                     
    fi
    if existsentry $KEY BIB; then 
      echo "<a href="                                                   
      echo "\"$(getentry $KEY BIB)\""                                  
      echo "onmouseout=\"MM_swapImgRestore()\" onmouseover="           
      echo "\"MM_swapImage('Image${KEY}BIB','','bib_2.jpg',1)\"><img src="    
      echo "\"bib_1.jpg\" name=\"Image${KEY}BIB\" alt=\"[BIB]\" width=\"29\" height=\"29\"" 
      echo "border=\"0\" id=\"Image${KEY}BIB\"></a>"                     
    fi
    cat << EOF
        </span></td>
        <td width="20">&nbsp;</td>

        <td><span class="papertitle">
EOF
    echo "$(getentry $KEY TITLE)."
    cat << EOF
        </span><br>
EOF
    if existsentry $KEY INFO; then
      if existsentry $KEY BOOKTITLE; then
        echo "<span class=\"texto\">In <em>$(getentry $KEY BOOKTITLE)</em>"
        if existsentry $KEY CONFLINK; then
          echo "(<em><a href=\"$(getentry $KEY CONFLINK)\">$(getentry $KEY CONFSHORT)</a></em>),"
        fi
      fi
      if existsentry $KEY JOURNAL; then
        echo "<span class=\"texto\"><a href=\"$(getentry $KEY JOURNALLINK)\"><em>$(getentry $KEY JOURNAL)</em></a>,"
      fi
      echo $(getentry $KEY INFO)
    else
      if existsentry $KEY BOOKTITLE; then
        echo "<span class=\"texto\">In <em>$(getentry $KEY BOOKTITLE)</em>"
        if existsentry $KEY CONFLINK; then
          echo "(<em><a href=\"$(getentry $KEY CONFLINK)\">$(getentry $KEY CONFSHORT)</a></em>)."
        fi
      fi
      if existsentry $KEY JOURNAL; then
        echo "<span class=\"texto\"><a href=\"$(getentry $KEY JOURNALLINK)\"><em>$(getentry $KEY JOURNAL)</em></a>."
      fi
    fi
    if existsentry $KEY NOTE; then
      echo "<br> $(getentry $KEY NOTE)."
    fi
  cat << EOF
        </span> </tr>
EOF
}

cat << EOF
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
  <meta name="generator" content=
  "HTML Tidy for Linux/x86 (vers 12 April 2005), see www.w3.org">
  <meta http-equiv="Content-Type" content=
  "text/html; charset=us-ascii">

  <title>Dr. Hannes Moser (this page is no longer maintained)</title>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}
  function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
  function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}
  function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
function frob(msg) {
     msg = msg.replace(/[A-Z1 ]/g, "");
     document.write("<a href=\"mailto:" + msg + "\">" + msg + "<" + "/a>");
}
</script>
  <link href="HM_style.css" rel="stylesheet" type="text/css">

<script type="text/javascript">
var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-7341412-1");
pageTracker._trackPageview();
} catch(err) {}</script>

</head>

<body leftmargin="0" topmargin="0" onload=
"MM_preloadImages('pdf_2.jpg','bib_2.jpg')">
  <table width="700" height="300" border="0" cellpadding="0" summary="Header"
  cellspacing="0">
    <tr>
      <td width="60" bgcolor="#CCCCCC"></td>

      <td width="270" align="left" valign="top"><img src=
      "Hannes_M.jpg" alt="Photo of Hannes Moser" width="243" height="300"></td>

      <td align="left" valign="top">
        <h1 class="nombre"><font face=
        "Verdana, Arial, Helvetica, sans-serif">Dr. Hannes
        Moser</font></h1>

        <p>
        <br>
        <span class="texto">
        I have moved to industry, but I am still regularly reading
        emails sent to the following address.</span></p>
        <p>
        <span class="texto">E-mail:</span> <script type=
        "text/javascript">
frob("Xhannes.moser1 @ Xgmail .comX");
</script> <noscript>[displayed if Javascript is
activated]</noscript>
        <p>
        <br>
        <span class="texto">
        This page is no longer maintained. See also <a href="http://www.informatik.uni-trier.de/~ley/pers/hd/m/Moser:Hannes.html">my publications</a> at <a href="http://www.informatik.uni-trier.de/~ley/db/welcome.html">DBLP</a>,
        and <a href="http://academic.research.microsoft.com/Author/10658010/hannes-moser">my publications and citations</a> at <a href="http://academic.research.microsoft.com/">Microsoft Academic Search</a>.
        </span>
        </p>

      </td>
    </tr>
  </table>

  <table width="700" border="0" cellspacing="0" cellpadding="10" summary="Book Chapters">
    <tr>
      <td width="40" bgcolor="#993333">&nbsp;</td>

      <td>
EOF

cat << EOF
        <h2><span class="titulo">Book Chapters</span></h2>

        <table width="100%" border="0" cellspacing="0" cellpadding=
        "0" summary="Book chapters">
EOF
for KEY in $(cat BOOKCHAPTERS.def); do
  makepubentry $KEY
cat << EOF
    <tr valign="top">
      <td width="165" align="right">&nbsp;</td>

      <td width="20">&nbsp;</td>

      <td>&nbsp;</td>
    </tr>
EOF
done 

cat << EOF
        </table>

        <h2 class="titulo"><br></h2>
      </td>
    </tr>
  </table>

  <table width="700" border="0" cellspacing="0" cellpadding="10" summary="Journal Articles">
    <tr>
      <td width="40" bgcolor="#CCCCCC">&nbsp;</td>
      
      <td>
        <h2><span class="titulo">Journal Articles</span></h2>

        <table width="100%" border="0" cellspacing="0" cellpadding=
        "0" summary="Journal Articles">
EOF
for KEY in $(cat JOURNAL.def); do
  makepubentry $KEY
cat << EOF
    <tr valign="top">
      <td width="165" align="right">&nbsp;</td>

      <td width="20">&nbsp;</td>

      <td>&nbsp;</td>
    </tr>
EOF
done 

cat << EOF
        </table>

        <h2 class="titulo"><br></h2>
      </td>
    </tr>
  </table>

  <table width="700" border="0" cellspacing="0" cellpadding="10" summary="Conferences">
    <tr>
      <td width="40" bgcolor="#993333">&nbsp;</td>

      <td>
        <h2><span class="titulo">Conference Articles</span></h2>

        <table width="100%" border="0" cellspacing="0" cellpadding=
        "0" summary="Conferences">
EOF
for KEY in $(cat CONFERENCE.def); do
  makepubentry $KEY
cat << EOF
          <tr valign="top">
            <td width="165" align="right">&nbsp;</td>

            <td width="20">&nbsp;</td>

            <td>&nbsp;</td>
          </tr>
EOF
done 

cat << EOF
        </table>

        <h2 class="titulo"><br></h2>
      </td>
    </tr>
  </table>


  <table width="700" border="0" cellspacing="0" cellpadding="10" summary="Theses">
    <tr>
      <td width="40" bgcolor="#CCCCCC">&nbsp;</td>

      <td>
        <h2 class="titulo">Theses</h2>

        <table width="100%" border="0" cellspacing="0" cellpadding=
        "0" summary="Theses">

          <tr valign="top">
            <td width="165" align="right"><span class=
            "autores">Hannes Moser</span><span class="texto"><br>
            <a href="diss_moser.pdf" onmouseout="MM_swapImgRestore()"
            onmouseover=
            "MM_swapImage('Image444','','pdf_2.jpg',1)"><img src=
            "pdf_1.jpg" name="Image444" width="29" height="29"
            border="0"></a></span></td>

            <td width="20">&nbsp;</td>

            <td><span class="papertitle">Finding Optimal Solutions for
            Covering and Matching Problems.</span><br>
            <span class="texto">Dissertation, Institut f&#252;r
            Informatik, Friedrich-Schiller-Universit&#228;t Jena,
            2009. <a href="http://www.cuvillier.de/flycms/de/html/30/-UickI3zKPS7xcEY">
            Published by Cuvillier</a>, 2010.</span></td>
          </tr>

          <tr valign="top">
            <td width="165" align="right">&nbsp;</td>

            <td width="20">&nbsp;</td>

            <td>&nbsp;</td>
          </tr>

          <tr valign="top">
            <td width="165" align="right"><span class=
            "autores">Hannes Moser</span><span class="texto"><br>
            <a href="Mos05a.pdf" onmouseout="MM_swapImgRestore()"
            onmouseover=
            "MM_swapImage('Image4','','pdf_2.jpg',1)"><img src=
            "pdf_1.jpg" name="Image4" width="29" height="29"
            border="0"></a></span></td>

            <td width="20">&nbsp;</td>

            <td><span class="papertitle">Exact Algorithms for
            Generalizations of Vertex Cover.</span><br>
            <span class="texto">Diplomarbeit, Institut f&#252;r
            Informatik, Friedrich-Schiller-Universit&#228;t Jena,
            2005.</span></td>
          </tr>
EOF

cat << EOF
        </table>

        <h2 class="titulo"><br></h2>
      </td>
    </tr>
  </table>


  <table width="700" border="0" cellspacing="0" cellpadding="10">
    <tr>
      <td width="40" bgcolor="#993333">&nbsp;</td>

      <td>
        <h2 class="titulo">Further Talks</h2>

        <table width="100%" border="0" cellspacing="0" cellpadding=
        "0">
            <tr valign="top">
              <td width="165" align="right" class="texto">
              <span class="titulo"><a href=
              "DFG_SPP_1126_Jahreskolloquium_2007_presentation.pdf"
              onmouseout="MM_swapImgRestore()" onmouseover=
              "MM_swapImage('Image9','','talk_2.jpg',1)"><font size=
              "1"><img src="talk_1.jpg" name="Image9" width="29"
              height="29" border="0"></font></a></span><br></td>

              <td width="20">&nbsp;</td>

              <td class="texto"><span class="papertitle">Iterative Compression:
              Some Case Studies.</span><br>
              Talk held at the Colloquium of the <a href=
              "http://www.dfg-schwerpunkt-1126.de/">DFG-Schwerpunkt
              1126</a> &#8220;Algorithms on large and complex
              networks&#8221;, Freiburg, Germany, July 04&#8211;06,
              2007.</td>
            </tr>
            
          <tr valign="top">
            <td width="165" align="right">&nbsp;</td>

            <td width="20">&nbsp;</td>

            <td>&nbsp;</td>
          </tr>

          <tr valign="top">
            <td width="165" align="right" class="autores">
            <span class="texto"><span class="titulo"><a href=
            "http://theinf1.informatik.uni-jena.de/%7Emoser/GI-Dagstuhl_2006_Test_Design_presentation.pdf"
            onmouseout="MM_swapImgRestore()" onmouseover=
            "MM_swapImage('Image52','','talk_2.jpg',1)"><font size=
            "1"><img src="talk_1.jpg" name="Image52" width="29"
            height="29" border="0" id=
            "Image52"></font></a></span></span></td>

            <td width="20">&nbsp;</td>

            <td><span class="papertitle">Experiments: Test
            Design.</span><br>
            <span class="texto">Talk held at the GI-Dagstuhl
            <a href=
            "http://www.algo.informatik.tu-darmstadt.de/gi-seminar/">
            Research Seminar 06362</a> &#8220;Algorithm
            Engineering&#8221;, Dagstuhl, Germany, September
            4&#8211;8, 2006.</span></td>
          </tr>

          <tr valign="top">
            <td width="165" align="right">&nbsp;</td>

            <td width="20">&nbsp;</td>

            <td>&nbsp;</td>
          </tr>

          <tr valign="top">
            <td width="165" align="right" class="texto">
            <span class="titulo"><a href=
            "DFG_SPP_1126_Jahreskolloquium_2006_presentation_moser.pdf"
            onmouseout="MM_swapImgRestore()" onmouseover=
            "MM_swapImage('Image4','','talk_2.jpg',1)"><font size=
            "1"><img src="talk_1.jpg" name="Image5" width="29"
            height="29" border="0"></font></a></span><br></td>

            <td width="20">&nbsp;</td>

            <td class="texto"><span class="papertitle">Iterative
            Compression for Solving Hard Network
            Problems.</span><br>
            Talk held at the Colloquium of the <a href=
            "http://www.dfg-schwerpunkt-1126.de/">DFG-Schwerpunkt
            1126</a> &#8220;Algorithms on large and complex
            networks&#8221;, Aachen, Germany, June 12&#8211;14,
            2006.</td>
          </tr>
EOF

cat << EOF
        </table>
      </td>
    </tr>
  </table>
</body>
</html>
EOF
