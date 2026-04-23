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

<cfif isdefined('thePracID') and isnumeric(thePracID)>
  <cfelse>
  <cfset thePracID = 0>
</cfif>


<cfquery name="ThePractice" datasource="#application.dsnnameMySQL#">
SELECT	sv_id,
        sv_title,
        sv_text,
        sv_contact,
        sv_photo1,
        sv_inactive,
        sv_deleted,
        sv_sortorder
FROM	services_tb
WHERE	   sv_id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#thePracID#">
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
         <cfoutput query="ThePractice">

        <img src="https://www.hpattorneys.com/Images/practices/#sv_photo1#" alt="#sv_title#">
   
<div class="ThePracHd">#sv_title#</div>
<div class="ThePracText">#sv_text#</div>
          <div class="thePracListHeader">Contact:</div>
<cfquery name="ListPContacts" datasource="#application.dsnnameMySQL#">
      SELECT	bi_name,
              	bi_tagline,
              	sv_title,
              	bi_id,
                sv_id,
                bi_cat,
                is2c_sortorder
      FROM		bios_tb
              INNER JOIN practice_2_bio_tb ON bi_id = is2c_Bio
              INNER JOIN services_tb ON sv_id = is2c_Prac
      WHERE	bi_deleted = 0 AND
            bi_inactive = 0 AND
            is2c_Prac = #sv_id# and bi_cat = 1
       ORDER BY is2c_sortorder
</cfquery>
<cfquery name="ListoPContacts" datasource="#application.dsnnameMySQL#">
      SELECT	bi_name,
              	bi_tagline,
              	sv_title,
              	bi_id,
                sv_id,
                bi_cat,
                is2c_sortorder
      FROM		bios_tb
              INNER JOIN practice_2_bio_tb ON bi_id = is2c_Bio
              INNER JOIN services_tb ON sv_id = is2c_Prac
             
      WHERE	bi_deleted = 0 AND
            bi_inactive = 0 AND
            is2c_Prac = #sv_id# and bios_tb.bi_cat IN (2,3)
       ORDER BY is2c_sortorder
</cfquery>

          <ul>
          <cfloop query="ListPContacts">
            <li><a href="People-Details.cfm?theBioID=#bi_id#&thePracID=#sv_id#">#bi_name#</a></li>
          </cfloop>
          </ul>
          <cfif ListoPContacts.recordcount neq 0>
          <div class="thePracListHeader">Other Practice Area Attorneys</div>
           <ul>
           <cfloop query="ListoPContacts">
            <li><a href="People-Details.cfm?theBioID=#bi_id#&thePracID=#sv_id#">#bi_name#</a></li>
          </cfloop>
          </ul>
          </cfif>
       
    </cfoutput>
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