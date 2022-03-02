using System;
using System.Configuration;
using System.IO;
using System.Net;
using System.Text;
using System.Xml;
using System.Xml.Xsl;

public partial class _Default : System.Web.UI.Page
{
    public string TipoMenu = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        //Preguntar si la url trae un "id"
        //http://localhost:50774/Default.aspx
        if (Request.QueryString["id"] == null)
        {
            TipoMenu = "0";
        }
        else
        {
            TipoMenu = Request.QueryString["id"];
        }

        TransformaXML();
    }

    private void TransformaXML()
    {
        string xmlPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "xml/menu.xml";

        string xsltPath = ConfigurationManager.AppSettings["FileServer"].ToString() + "xslt/template.xslt";

        XmlTextReader trMenu = new XmlTextReader(xmlPath);

        //credenciales
        XmlUrlResolver resolver = new XmlUrlResolver();
        resolver.Credentials = CredentialCache.DefaultCredentials;
        
        //Crear la configuración para poder accrder al XSLT
        //Los parámetros true son para poder tratar al xslt como documento y poder ttransformarlo
        XsltSettings settings = new XsltSettings(true, true);

        //Leer XSLT
        XslCompiledTransform xslt = new XslCompiledTransform();
        xslt.Load(xsltPath, settings, resolver);
                
        //Creamos  a donde enviar la transformación 
        StringBuilder sBuilder = new StringBuilder();
        TextWriter tWriter = new StringWriter(sBuilder);
        XsltArgumentList xslArgs = new XsltArgumentList();
        xslArgs.AddParam("TipoMenu", "", TipoMenu);
        xslt.Transform(trMenu, xslArgs, tWriter);
        string resultado = sBuilder.ToString();
        Response.Write(resultado);
    }
}