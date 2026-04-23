<!DOCTYPE html>
<html><!-- InstanceBegin template="/Templates/ohMobileHome.dwt" codeOutsideHTMLIsLocked="false" -->
<!-- InstanceBeginEditable name="doctitle" -->
<title>Hankin Sandman Palladino Weintrob & Bell</title>
<!-- InstanceEndEditable -->
<meta name="Author" content="Emaxed (Internet Software Solutions) | Strawbridge Professional Ctr. | 212 W. Rt. 38 - Suite 106 - Moorestown, NJ 08057-3260 - (856) 428-8038 - www.emaxed.com - 'professionalism | creativity | effectivenesss'">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/ohMobile.css">
<link rel="stylesheet" href="css/ohMobile-Black.css">
<link rel="stylesheet" href="css/ohMobile-Custom.css">
<link rel="stylesheet" href="css/font-awesome-master/h5p-font-awesome.min.css">
<script src="js/jquery-3.3.1.js"></script>


<!-- InstanceBeginEditable name="head" -->

<cfif isdefined('theBioID') and isnumeric(theBioID)>
  <cfelse>
  <cfset theBioID = 0>
</cfif>

<cfquery name="ListAllBios" datasource="#application.dsnnameMySQL#">
      SELECT  bi_id,
              bi_name,
              bi_title,
              bi_tagline,
              bi_copy,
              bi_image,
              bi_dateadded,
              bi_lastmodified,
              bi_inactive,
              bi_deleted,
              bi_datedeleted,
              bi_sortOrder,
              bi_bar,
              bi_practice,
              bi_education,
              bi_phone,
              bi_vitae
      FROM	bios_tb
      WHERE	bi_deleted = 0 AND
            bi_inactive = 0
            <cfif isdefined('theBioID')>AND bi_id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#theBioID#"></cfif>
      ORDER BY	bi_sortOrder ASC
</cfquery>
<!-- InstanceEndEditable -->
<body>

  <!-- Side Navigation -->
  <nav class="w3-sidebar w3-bar-block w3-card w3-animate-left w3-center" style="display:none" id="mySidebar">
    <button class="w3-bar-item w3-button" onClick="w3_close()">Close <i class="fa fa-remove"></i></button>
    <ul>
    <li><a href="hspwb_home.cfm">home</a></li>
    <li><a href="people.cfm">people</a></li>
    <li><a href="practice.cfm">practice</a></li>
    <li><a href="locations.cfm">locations</a></li></ul>
</nav>


  <!-- Header -->
  <header class="w3-container w3-theme w3-padding" id="myHeader">
    <div class="w3-center"> <img src="images/hspwb_logo_2024.jpg" id="theLogo"><i onClick="w3_open()" class="fa fa-bars w3-xlarge w3-button w3-theme" id="theMenuBut"></i> </div>
    </div>
  </header>
  <div class="w3-container">
    <div class="w3-center"> <!-- InstanceBeginEditable name="Body" -->
           <cfoutput query="ListAllBios">    
      <aside class="thePeopleView">
        <div class="thePeople">
          <div class="ThePhoto"><img src="https://www.hpattorneys.com/Images/people/#bi_image#" alt="#bi_name# - #bi_title# - #bi_tagline#"> </div>
          <div class="TheDetails">
            <div class="theBioName">#bi_name#</div>
            <div class="TheBioTitle">#bi_title#</div>
            <div class="TheBioTag">
            <p><a href="mailto:#bi_tagline#">#bi_tagline#</a></p>
            <p id="theNumber"><a href="tel:+1#bi_phone#" title="#bi_name# - #bi_phone#">#bi_phone#</a></p></div>
            <cfif bi_vitae neq "">
              <p id="thevitae"><a href="https://www.hpattorneys.com/pdfs/#bi_vitae#" title="Download Curriculum Vitae for the #bi_name#" target="_blank">Download Curriculum Vitae</a></p></cfif>
            <cfif bi_bar neq "">
              <div class="theDetailsHeaders">bar admissions:</div>
              #bi_bar#
            </cfif>
            <cfif bi_practice neq "">
              <div class="theDetailsHeaders">practices:</div>
              #bi_practice#
            </cfif>
            <cfif bi_education neq "">
              <div class="theDetailsHeaders">education:</div>
              #bi_education#
            </cfif>
            <cfif bi_id eq 1>
              <div class="theDetailsHeaders">Publications:</div>
              <ul>
             <li><a href="Pdfs/NJLJ03262020444437Hankin.pdf" title="Open PDF Article in a New Window" target="_blank">NJ Law Journal</a></li>
              </ul>
            </cfif>
          </div>
          <div class="TheBioDetails"> #bi_copy# </div>
        </div>
      </aside></cfoutput>
      <!-- InstanceEndEditable --> </div>
  </div>
  <!-- Footer -->
 <footer class="w3-container w3-theme-dark">
    <div class="SocialGroup2">
       <div class="card"> <a href="https://www.instagram.com/hp_attorneys/" target="_blank"><img src="Images/SocialIcons/x-social-media-white-round-icon.png" alt="Go To X new window"></a></div>
        <div class="card"> <a href="https://www.instagram.com/hp_attorneys/profilecard/" target="_blank"><img src="Images/SocialIcons/insta-white.png" alt="Go To instagram new window"></a></div>
        <div class="card"> <a href="https://www.facebook.com/HPAttorneysAC" target="_blank"><img src="images/SocialIcons/facebook-white.png" alt="Go To Facebook in new window"></a></div>
        <div class="card"> <a href="https://www.linkedin.com/company/hpattorneys" target="_blank"><img src="Images/SocialIcons/linkedin-white.png" alt="Go To linkedin new window"></a></div>
   </div>
       <p>Hankin Palladino Weintrob Bell & Labov <br>
 <cfoutput>#year(now())#</cfoutput> ALL RIGHTS RESERVED.</p>
</footer>

<script>
// Side navigation
function w3_open() {
  var x = document.getElementById("mySidebar");
  x.style.width = "100%";
  x.style.fontSize = "40px";
  x.style.paddingTop = "10%";
  x.style.display = "block";
}

function w3_close() {
  document.getElementById("mySidebar").style.display = "none";
}
</script>

</body>
<!-- InstanceEnd --></html>