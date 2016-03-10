<?
  require_once('magpierss/rss_fetch.inc');
  $release="1.5";
?>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"
        "http://www.w3.org/TR/REC-html40/loose.dtd">
<HTML>
<HEAD>
  <LINK REL="STYLESHEET" HREF="thomas.css" TYPE="text/css">
  <meta name="description" content="A Matlab/Octave toolbox for reading and writing SEG-Y formatted files">
  <meta name="keywords" content="matlab, seg-y, segy, sgy, seg">
  <TITLE>SegyMAT : A Matlab and Octave toolbox for reading and writing SEG-Y formatted files</TITLE>
</HEAD>

<BODY>
<H1>
SegyMAT : Read and Write SEG-Y files using <A HREF="http://www.mathworks.com/">Matlab</A> and <A HREF="http://www.octave.org/">Octave</A>. <BR>
</H1>

<H5>

M-files to read and write SEG-Y files from Matlab, implemented using the syntax of the SEG-Y format : SEG-Y revision 0 (1975) and revision 1 (May 2002) [<A HREF="http://www.seg.org/documents/10161/77915/seg_y_rev1.pdf">pdf</A>].
</H5>
	

<CENTER>This site is hosted by<BR>
<A href="http://sourceforge.net/projects/segymat">
<IMG src="http://sourceforge.net/sflogo.php?group_id=39015&type=1" width="88" height="31" border="0" alt="SourceForge Logo"> </A>
</CENTER>


<!-- -------------------------------------------------------------------------------------- -->
<DIV CLASS="title">Introduction</DIV>
SegyMAT is a set of Matlab files for reading and writing SEG-Y files from <A HREF="http://www.mathworks.com">Matlab</A>.
<P>
SegyMAT aims at being both simple to use to read SEG-Y files, and extensive enough to aid in writing complex seismic data.
<P>
A <A HREF="http://www.python.org">Python</A> port of the library has initiated under the name : <A HREF="http://segymat.sourceforge.net/segypy/">SegyPY</A><P>
ADD : SegyMAT has a family member called <A HREF="http://lasymat.sourceforge.net">lasYmat</A>. A set of mfiles to read LAS files. It is currently under development, but useful.
<P>

 <!-- -------------------------------------------------------------------------------------- -->
<DIV CLASS="title">Download</DIV>
<BR>
The latest release is available from <A HREF="https://sourceforge.net/projects/segymat/">Sourceforge</A>.
<!--
<?
$today = getdate();
# today, 12AM
$date = mktime(0,0,0,$today['mon'], $today['mday'], $today['year']);
$rss = fetch_rss("http://sourceforge.net/export/rss2_projfiles.php?group_id=39015");

foreach ( $rss->items as $item ) {
	$published = parse_w3cdtf($item['dc']['date']);
		$href = $item['link'];
		$title = $item['title'];
		$href="http://sourceforge.net/project/showfiles.php?group_id=39015";
		$href="http://sourceforge.net/projects/segymat/files/SegyMAT/";
		echo "<li><a href=$href>Download latest release</a></li>";
	break;
}
-->
?>

<BR>
<!-- -------------------------------------------------------------------------------------- -->
<DIV CLASS="title">Documentation</DIV>
<P>
SegyMAT user guide : [<A HREF="http://segymat.sourceforge.net/segymat-1.5.pdf">PDF</A>] [<A HREF="doc/index.html">HTML</A>]


<!-- -------------------------------------------------------------------------------------- -->
<DIV CLASS="title">Mailing List</DIV>
If you have suggestions, questions, bug-fixes, please join the
Please join the <A HREF="https://lists.sourceforge.net/lists/listinfo/segymat-user">segymat-user</A>
mailinglist, and post them there.
<P>


<!-- -------------------------------------------------------------------------------------- -->
<DIV CLASS="title">News</DIV>
<BR>
<?
$today = getdate();
# today, 12AM
$date = mktime(0,0,0,$today['mon'], $today['mday'], $today['year']);
// $rss = fetch_rss("http://sourceforge.net/export/rss2_projnews.php?group_id=39015&rss_fulltext=1");
$rss = fetch_rss("http://sourceforge.net/p/segymat/news/feed");
$i=0;
foreach ( $rss->items as $item ) {
	$published = parse_w3cdtf($item['dc']['date']);
	$i++;
		$href = $item['link'];
		$pubDate = $item['pubdate'];
		$title = $item['title'];
		$description = $item['description'];
		echo "<TABLE>";
		echo "<TR><TD><FONT SIZE=-2>$pubDate</FONT></TD></TR>";
		echo "<TR CLASS=\"smaller\"><TH ALIGN=\"left\" WIDTH=\"500\">";
                echo "<a href=$href>$title</a></li>";
		echo "</TH>";
		echo "</TR>";
		echo "<TR xCLASS=\"smaller\"><TD>";
		echo "$description";
		echo "</TD></TR>";

		echo "</TABLE>";
		if ($i==2) {
		  break;
		}

}

?>
<P>
<A HREF="http://sourceforge.net/news/?group_id=39015">.... More News -></A>
<P>
<BR>


<!-- -------------------------------------------------------------------------------------- -->
<!--
<DIV CLASS="title">Download standalone GUI</DIV>
The <A HREF="https://sourceforge.net/project/showfiles.php?group_id=39015&package_id=31228">development version</A> of SegyMAT contains a graphical user interface, that can be compiled to a standalone application.
<P>
Below you will find a Windows installer, and a tar.bz2 archive for linux, to run the SegyMAT gui, without Matlab. Both requires the Matlab Component Library, which is included, and which is the reason for the large (app 80Mb) filesize.
<P>
<A HREF="http://www.gfy.ku.dk/~tmh/segymat_binary/segymat_gui_binary_linux.tar.bz2">segymat_gui_binary_linux.tar.bz2</A> (app. 80Mb)
<BR>
<A HREF="http://www.gfy.ku.dk/~tmh/segymat_binary/README_STANDALONE">README_STANDALONE</A>
-->

<!--
<TABLE WIDTH="300" CLASS="smaller">
<TR>
<TH>platform</TH>
<TH>release</TH>
<TH>readme</TH>
</TR>

<TR>
<TD>win32</TD>
<TD>
<A HREF="http://www.gfy.ku.dk/~tmh/segymat_binary/win32/SetupSegyMAT_MCR.exe">SegyMat 1.03 + MCR library</A><BR>
</TD>
<TD>
</TD>
</TR>

<TR>
<TD>win32</TD>
<TD>
<A HREF="http://www.gfy.ku.dk/~tmh/segymat_binary/linux-i386/segymat_gui_binary_linux.tar.bz2">segymat_gui_binary_linux.tar.bz2</A>
</TD>
<TD>
<A HREF="http://www.gfy.ku.dk/~tmh/segymat_binary/linux-i386/README_STANDALONE">README</A>
</TD>
</TR>
</TABLE>

-->


<!-- -------------------------------------------------------------------------------------- -->
<DIV CLASS="title">Links</DIV>
Some links to other programs using SegyMAT;<P>
<A HREF="http://www.icm.csic.es/geo/gma/graf2segy.html">IMAGE2SEGY</A> : Raster BM/JPG to SEGY conversion <BR>
<P>




<!-- -------------------------------------------------------------------------------------- -->
<DIV CLASS="title">Donate</DIV>
<P>
If you feel you want to contribute with a donation to the development, you can do so here :<BR>
<A HREF="http://sourceforge.net/donate/index.php?group_id=39015">Donate to SegyMAT</A>



<!-- -------------------------------------------------------------------------------------- -->
<!--
<DIV CLASS="title">Releases</DIV>
<B>The current version is 1.03</B> <BR>
+ Read/Write IEEE/IBM Floar/Integer Segy files<BR>
+ Read/Write SU files<BR>
+ Partial support for SEG-Y revision 0 (1975)<BR>
  + support for the IBM FLOATING FORMAT format<BR>
  - No support for fixed point data types<BR>
+ Support for ASCII/EBCDIC headers<BR>
+ Support for Extended textual headers<BR>
+ Octave support for command line commands :)<BR>
<P>

<B>RELEASE PLANS</B><P>

<B>Release 1.2</B> (planned release : 01/06/2005) : <BR>
+ G functional SEG-Y GUI reader/plotter for Matlab.<BR>
+ A GUI to edit header values.<BR>
+ plotting fascilities
-->
<P>

<!-- -------------------------------------------------------------------------------------- -->
<DIV CLASS="title">Acknowledgment</DIV>
Thanks to Brian Farrelly, Norsk Hydro Research Centre, Bergen, Norway,
for supplying functions to convert between IBM Floating Point format and doubles.
<P>
Thanks to Urs Boeringer for adding a patch to WriteSegy, to enable use of an arbitrary set of TraceHeader values.
<P>
<para>
'sacsun2mat' was written by F Tilmann whos based his work on sac_sun2pc_mat  by C. D. Saragiotis. from  <A HREF="http://www.mathworks.com/matlabcentral/fileexchange/loadFile.do?objectId=5546">Matlab Central</A>.


<P>

Thanks to <A href="http://sourceforge.net">Sourceforge</A> for hosting the project.
<P>
<!--
The core m-files are implemented with heavy use of Matlab-structures, influenced by the
way <A HREF="http://rubble.phys.ualberta.ca/%7Esacchi/SEISMIC_LAB/">SeismicLab</A>
reads <A HREF="http://www.cwp.mines.edu/cwpcodes/">SU</A>-formatted data.
<P>
-->
<HR>
<ADDRESS>
(C) 2001-2015 Thomas Mejer Hansen, [<A HREF="mailto:thomas.mejer.hansen@gmail.com">mail</A> - <A HREF="http://imgp.nbi.ku.dk/">www</A>]
</ADDRESS>

<script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
</script>
<script type="text/javascript">
_uacct = "UA-401277-10";
urchinTracker();
</script>

</BODY>
</HTML>


