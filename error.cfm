<!--- Email Error Message --->
<cfmail to="#session.e_bccEmail#"
        from="#session.e_user#"
         subject="Errors:VPS 12 - m.hankinsandman.com - ERROR ***"
        server="#session.e_server#"
        type="HTML"
        username="#session.e_user#"
        password="#session.e_pass#">
<b>Cause:</b> <br>#exception.RootCause.message#<br>
<br>

<cfdump var="#exception#" expand="yes">
<br />
<br />

<b>Page:</b> <br>#exception.RootCause.TagContext[1].Template# (Line: #exception.RootCause.TagContext[1].LINE#)<br>
<br>
	 ------------------------------------------------------------ <br><br>
	(#REMOTE_ADDR#) [#cgi.http_user_agent#]<br><br>
    ------------------------------------------------------------ <br><br>
    <cfdump var="#exception.rootcause#">
</cfmail>
<br><br>
<div style="width:600px; margin-left:auto; margin-right:auto; text-align:center; font-family:Verdana, Geneva, sans-serif; font-size:10pt;">We apologize for the inconvenience.  An unexpected error has occurred.<br>
Please <a href="javascript:history.go(-1);">click here</a> to return to the previous page.  If the error happens again,<br><br />
</div>
