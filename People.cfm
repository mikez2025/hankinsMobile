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
<cfquery name="ListPageCopy" datasource="#application.dsnnameMySQL#">
SELECT
pc_pagename,
pc_id,
pc_photo,
pc_pagetext
FROM
pagecopy_tb
Where pc_id = 2
</cfquery>
<cfquery name="ListBios" datasource="#application.dsnnameMySQL#">
SELECT		bic_name,
					bi_name,
					bi_sortOrder,
                    bi_id
FROM	bio_cat_tb
INNER JOIN bios_tb ON bic_id = bi_cat
WHERE		bi_inactive = 0 AND
				bi_deleted = 0
ORDER BY	bic_sortorder ASC, bi_sortOrder
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
    <cfoutput query="ListPageCopy">
      <img src="https://www.hpattorneys.com/Images/pages/#pc_photo#" alt="#pc_pagename#">
      </cfoutput>
     <cfoutput query="ListPageCopy">#pc_pagetext#</cfoutput>
      <cfoutput query="ListBios" group="bic_name">
       <div class="theListHeader">#bic_name#</div>
          <ul>
             
              <cfoutput>
              <li><a href="People-Details.cfm?theBioID=#bi_id#">#bi_name#</a></li>
            </cfoutput>
            </ul>
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