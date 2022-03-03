using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class contacto : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) //pregunta que sea la primer vez que carga la página
        {
            string from = Request.Form["contact_email"].ToString(); //el valor se recupera por nombre NO POR ID
            string nombre = Request.Form["contact_name"].ToString();
            string personas = Request.Form["contact_personas"].ToString();
            string extra = Request.Form["contact_adicionales"].ToString();
            string fecha = Request.Form["contact_fecha"].ToString();
            string hora = Request.Form["contact_hora"].ToString();
            string mensaje = "El cliente " + nombre + " ha realizado una reservación para el día " + "Fecha: " + fecha + " a las: " + hora + " hrs para " + (int.Parse(personas) + int.Parse(extra)).ToString() + " personas.";
           
            string subject = nombre + " Fecha: " + fecha + ". Hora: " + hora + ". Personas: " + (int.Parse(personas) + int.Parse(extra)).ToString();

            string resultado = sendGmail(from, subject, mensaje);
            Label1.Text = resultado;
            Response.Redirect("Default.aspx");
        }

    }

    string sendGmail(string from, string subject, string mensaje)
    {
        SmtpClient client = new SmtpClient();

        client.DeliveryMethod = SmtpDeliveryMethod.Network;
        client.EnableSsl = true;//Socket Secure Layer "https"
        client.Host = "smtp.gmail.com";
        client.Port = 587;

        //Autrenticarse en SMTP
        NetworkCredential credentials = new NetworkCredential("luisjorgecarrilloq@gmail.com","20033029Jcq$");
        client.UseDefaultCredentials = false;
        client.Credentials = credentials;

        //Creamos el correo
        MailMessage oMail = new MailMessage();
        oMail.From = new MailAddress(from);
        oMail.To.Add(new MailAddress("luisjorgecarrilloq@gmail.com"));
        oMail.CC.Add(new MailAddress(from));
        oMail.Subject = subject;
        oMail.IsBodyHtml = true;
        oMail.Priority = MailPriority.Low;
        oMail.Body = "<h1 style='color:purple;'>Reservación confirmada</h1><hr><br>" + "<div style='display:flex; align-items:center; justify-content:center; border:1px; border-color:white;'><p style='font-weight:bold; color:pink;'>" + mensaje + "</p></div>";

        try
        {
            client.Send(oMail);
            return "Correo enviado";
        }
        catch(Exception ex)
        {
            return "Error en el envío" + ex.Message;
        }



    }
}