<?xml version="1.0" encoding="UTF-8"?>
<xs:stylesheet version="1.0" xmlns:xs="http://www.w3.org/1999/XSL/Transform">
    <xs:template match="/">
        <html>
            <head>
                <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
                <title>XSLT EEEESSSSSSAAAA</title>
                <style>
                    table {
                    border: 2px solid black;
                    border-collapse: collapse;
                    }
                    td, th, tr {
                    border: 1px solid black;
                    text-align: center;
                    }
                    p {
                    color: green;
                    font-weight: bold;
                    }
                </style>
            </head>
            <body>
                <div class="container-fluid">
                    <div class="row">
                        <div class = "col-12 p-0">
                            <div class = "jumbotron min-vh-100 text-center d-flex flex-column">
                                <div id="teams">
                                    <p>TEAMS:</p>
                                    <table class="table table-hover table-striped">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>ID</th>
                                                <th>NAME</th>
                                                <th>CLUB</th>
                                                <th>NATIONALITY</th>
                                                <th>PRINCIPAL</th>
                                                <th>TACTICIAN</th>
                                                <th>VICTORIES</th>
                                                <th colspan="2">TEAM YACHT</th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <xs:for-each select="AmericasCup/teams/team">
                                                <tr>
                                                    <xs:if test="name='Emirates Team New Zealand'">
                                                        <td style="color: #00CED1;"><xs:value-of select="@id" /></td>
                                                        <td style="color: #00CED1;"><xs:value-of select="name" /></td>
                                                    </xs:if>
                                                    <xs:if test="name='Oracle Team USA'">
                                                        <td style="color: red;"><xs:value-of select="@id" /></td>
                                                        <td style="color: red;"><xs:value-of select="name" /></td>
                                                    </xs:if>
                                                    <xs:if test="name='Artemis Racing'">
                                                        <td style="color: blue;"><xs:value-of select="@id" /></td>
                                                        <td style="color: blue;"><xs:value-of select="name" /></td>
                                                    </xs:if>
                                                    <xs:if test="name='Groupama Team France'">
                                                        <td style="color: pink;"><xs:value-of select="@id" /></td>
                                                        <td style="color: pink;"><xs:value-of select="name" /></td>
                                                    </xs:if>
                                                    <xs:if test="name='Land Rover BAR'">
                                                        <td style="color: grey;"><xs:value-of select="@id" /></td>
                                                        <td style="color: grey;"><xs:value-of select="name" /></td>
                                                    </xs:if>
                                                    <xs:if test="name='SoftBank Team Japan'">
                                                        <td style="color: yellow;"><xs:value-of select="@id" /></td>
                                                        <td style="color: yellow;"><xs:value-of select="name" /></td>
                                                    </xs:if>
                                                    <td><xs:value-of select="club" /></td>
                                                    <td><xs:value-of select="nationality" />&#160;(<xs:value-of select="nationality/@code" />)</td>
                                                    <td><xs:value-of select="principal"/></td>
                                                    <td><xs:value-of select="tactician"/></td>
                                                    <td><xs:value-of select="victories"/></td>
                                                    <td><xs:value-of select="team_yacht/yacht_name" /></td>
                                                    <td><xs:value-of select="team_yacht/yacht_id" />&#160;<xs:value-of select="team_yacht/yacht_id/@refid" />&#160;sailno</td>
                                                </tr>
                                            </xs:for-each>
                                        </tbody>
                                    </table>
                                </div>
                                <div id = "helmsnams">
                                    <p>HELMSMANS:</p>
                                    <table class="table table-hover table-striped">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>TEAM ID</th>
                                                <th>First name</th>
                                                <th>Last name</th>
                                                <th>Nationality</th>
                                                <th>Championship titles</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <xs:for-each select="AmericasCup/helmsmans/helmsman">
                                                <tr>
                                                    <xs:if test="first_name='Peter'">
                                                        <td style="color: #00CED1;"><xs:value-of select="helmsman_team/@refid" /></td>
                                                    </xs:if>
                                                    <xs:if test="first_name='Jimmy'">
                                                        <td style="color: red;"><xs:value-of select="helmsman_team/@refid" /></td>
                                                    </xs:if>
                                                    <xs:if test="first_name='Nathan'">
                                                        <td style="color: blue;"><xs:value-of select="helmsman_team/@refid" /></td>
                                                    </xs:if>
                                                    <xs:if test="first_name='Franck'">
                                                        <td style="color: yellow;"><xs:value-of select="helmsman_team/@refid" /></td>
                                                    </xs:if>
                                                    <xs:if test="first_name='Ben'">
                                                        <td style="color: grey;"><xs:value-of select="helmsman_team/@refid" /></td>
                                                    </xs:if>
                                                    <xs:if test="first_name='Dean'">
                                                        <td style="color: pink;"><xs:value-of select="helmsman_team/@refid" /></td>
                                                    </xs:if>
                                                    <td><xs:value-of select="first_name" /></td>
                                                    <td><xs:value-of select="last_name" /></td>
                                                    <td><xs:value-of select="nationality" />&#160;(<xs:value-of select="nationality/@code" />)</td>
                                                    <td><xs:value-of select="championship_titles" />&#160;(<xs:value-of select="championship_titles/@amcup"/>)</td>
                                                </tr>
                                            </xs:for-each>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="yachts">
                                    <p>YACHTS:</p>
                                    <table class="table table-hover table-striped">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>ID</th>
                                                <th>SAILNO.</th>
                                                <th>CLASS</th>
                                                <th>LAUNCHED</th>
                                                <th>HIGHEST SPEED</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <xs:for-each select="AmericasCup/yachts/yacht">
                                                <tr>
                                                    <xs:if test="sailno='NZL-5'">
                                                        <td style="color: #00CED1;"><xs:value-of select="@yacht_id" /></td>
                                                        <td style="color: #00CED1;"><xs:value-of select="sailno" /></td>
                                                    </xs:if>
                                                    <xs:if test="sailno='USA-17'">
                                                        <td style="color: blue;"><xs:value-of select="@yacht_id" /></td>
                                                        <td style="color: red;"><xs:value-of select="sailno" /></td>
                                                    </xs:if>
                                                    <xs:if test="sailno='SWE-1'">
                                                        <td style="color: red;"><xs:value-of select="@yacht_id" /></td>
                                                        <td style="color: blue;"><xs:value-of select="sailno" /></td>
                                                    </xs:if>
                                                    <xs:if test="sailno='FR-1'">
                                                        <td style="color: blue;"><xs:value-of select="@yacht_id" /></td>
                                                        <td style="color: red;"><xs:value-of select="sailno" /></td>
                                                    </xs:if>
                                                    <xs:if test="sailno='GBR-1'">
                                                        <td style="color: red;"><xs:value-of select="@yacht_id" /></td>
                                                        <td style="color: blue;"><xs:value-of select="sailno" /></td>
                                                    </xs:if>
                                                    <xs:if test="sailno='JPN-1'">
                                                        <td style="color: blue;"><xs:value-of select="@yacht_id" /></td>
                                                        <td style="color: red;"><xs:value-of select="sailno" /></td>
                                                    </xs:if>
                                                    <td><xs:value-of select="class" /></td>
                                                    <td><xs:value-of select="launched" /></td>
                                                    <td><xs:value-of select="highest_speed" />&#160;<xs:value-of select="highest_speed/@unit"/>&#160;</td>
                                                </tr>
                                            </xs:for-each>
                                        </tbody>
                                    </table>
                                </div>
                                <div id="world_series_regattas">
                                    <p>WORLD SERIES REGATTAS:</p>
                                    <table class="table table-hover table-striped">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th>ID</th>
                                                <th colspan="2">LOCALIZATION</th>
                                                <th>DATE</th>
                                                <th>RACES</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <xs:for-each select="AmericasCup/world_series_regattas/regattas">
                                                <tr>
                                                    <td><xs:value-of select="@r_id" /></td>
                                                    <td><xs:value-of select="localization/city" />&#160;(<xs:value-of select="localization/city/@place"/>)</td>
                                                    <td><xs:value-of select="localization/country" />&#160;(<xs:value-of select="localization/country/@code" />)</td>
                                                    <td><xs:value-of select="date" /></td>
                                                    <td><xs:value-of select="races" /></td></tr>
                                            </xs:for-each>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </body>
        </html>
    </xs:template>
</xs:stylesheet>