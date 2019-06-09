package zad;//package my.examples;

import org.w3c.dom.*;
import org.w3c.dom.bootstrap.DOMImplementationRegistry;
import org.w3c.dom.ls.DOMImplementationLS;
import org.w3c.dom.ls.LSOutput;
import org.w3c.dom.ls.LSParser;
import org.w3c.dom.ls.LSSerializer;

import java.io.FileOutputStream;

// rejestr do tworzenia implementacji DOM
// Implementacja DOM Level 3 Load & Save
// Konfigurator i obsluga bledow
// Do pracy z dokumentem

public class Main {
    public static Document document;

    public static void AddTeam(String name, String club, String nat, String principal, String tact, String vic, String yachtn, String idy ){
        Element newElem = document.createElement("team");
        Element nam = document.createElement("name");
        Element clu = document.createElement("club");
        Element nationality = document.createElement("nationality");
        Element principa = document.createElement("principal");
        Element tactician = document.createElement("tactician");
        Element victories = document.createElement("victories");
        Element newTY = document.createElement("team_yacht");
        Element yname = document.createElement("yacht_name");
        Element yid = document.createElement("yacht_id");

        nam.setTextContent(name);
        clu.setTextContent(club);
        nationality.setTextContent(nat);
        principa.setTextContent(principal);
        tactician.setTextContent(tact);
        victories.setTextContent(vic);
        yname.setTextContent(yachtn);
        yid.setTextContent(idy);
        newTY.appendChild(yname);
        newTY.appendChild(yid);
        newElem.appendChild(nam);
        newElem.appendChild(clu);
        newElem.appendChild(nationality);
        newElem.appendChild(principa);
        newElem.appendChild(tactician);
        newElem.appendChild(victories);
        newElem.appendChild(newTY);
        document.getFirstChild().insertBefore(newElem, null);
    }

    public static void AddRegattas(String c, String coun, String dat, String rac){
        Element newElem = document.createElement("regattas");
        Element nam = document.createElement("localization");
        Element clu = document.createElement("city");
        Element nationality = document.createElement("country");
        Element principa = document.createElement("date");
        Element tactician = document.createElement("races");

        clu.setTextContent(c);
        nationality.setTextContent(coun);
        principa.setTextContent(dat);
        tactician.setTextContent(rac);
        nam.appendChild(clu);
        nam.appendChild(nationality);
//        newElem.setAttribute("r_id=","'10'");
        newElem.appendChild(nam);
        newElem.appendChild(principa);
        newElem.appendChild(tactician);
        document.getLastChild().insertBefore(newElem,null);
    }

    public static void DeleteTeam(String id){
        Element team = document.getElementById(id);

        Node ame = document.getElementsByTagName("AmericasCup").item(0);
        Node teams = ((Element) ame).getElementsByTagName("teams").item(0);
        teams.removeChild(team);
    }

    public static void ShowTeam(String id){
        Element team = document.getElementById(id);

        StringBuilder stringBuilder = new StringBuilder();

        NodeList tt = team.getChildNodes();

        for (int i = 0; i < tt.getLength(); i++) {
            stringBuilder.append(tt.item(i).getTextContent());
        }
    }

    public static void main(String[] args) {
        if (args.length == 0) {
            printUsage();
            System.exit(1);
        }
        try {
            System.setProperty(DOMImplementationRegistry.PROPERTY, "org.apache.xerces.dom.DOMXSImplementationSourceImpl");
            DOMImplementationRegistry registry = DOMImplementationRegistry.newInstance();
            DOMImplementationLS impl = (DOMImplementationLS) registry.getDOMImplementation("LS");
            LSParser builder = impl.createLSParser(DOMImplementationLS.MODE_SYNCHRONOUS, null);
            DOMConfiguration config = builder.getDomConfig();
            System.out.println("Parsowanie " + args[0] + "...");
            // sparsowanie dokumentu i pozyskanie "document" do dalszej pracy
            document = builder.parseURI(args[0]);

//            AddTeam("essa","saas","dsad","das","da","da","adas","da");
//            AddRegattas("das","da","das","das");
//            DeleteTeam("ETNZ");
            ShowTeam("ENTZ");
            // pozyskanie serializatora
            LSSerializer domWriter = impl.createLSSerializer();
            // pobranie konfiguratora dla serializatora
            config = domWriter.getDomConfig();
            config.setParameter("xml-declaration", Boolean.TRUE);

            // pozyskanie i konfiguracja Wyjscia
            LSOutput dOut = impl.createLSOutput();
            dOut.setEncoding("utf-8");
            dOut.setByteStream(new FileOutputStream("new_" + args[0]));

            System.out.println("Serializing document... ");
            domWriter.write(document, dOut);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    private static void printUsage() {
        System.err.println("usage: java Dom3Demo uri");
        System.err.println();
        System.err.println("NOTE: You can only validate DOM tree against XML Schemas.");
    }
}
