using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace FrbaHotel.Utility
{
    class DBQuery
    {
        private List<string> qparams; //lista de parametros a pasar
        private string qrestype; //define si es SP, funcion, y tipo de resultado esperado
        private string qcontent; // sp o funcion invocada


        
        public void setQrestype(string newVal) { this.qrestype = newVal; }
        public string getQrestype() { return this.qrestype; }
        public void setQcontent(string newVal) { this.qcontent = newVal; }
        public string getQcontent() { return this.qcontent; }
        public void addQparam(string nParam) { this.qparams.Add(nParam); }
        public void cleanQparam() { this.qparams.Clear(); }

        public void exeQueryNoRet() {
            string qtemp=string.Concat(this.qcontent," (");
            if (this.qrestype == "NO") {
                //comparamos la cantidad de parametros del sp llamado con los que tiene realmente
                if (qcontent != null)
                {
                    int paramCnt = Utils.exeFunInt(string.Concat("fn_count_parameters ('", qcontent, "')"));
                    if (this.qparams.Count() == paramCnt)
                    {
                        for (int i = 0; i < paramCnt; i++)
                        {
                            qtemp = string.Concat(qtemp, this.qparams[i],",");
                        }

                    }
                    else { MessageBox.Show("La cantidad de parametros no coincide"); }
                }
                else { MessageBox.Show("Falta definir nombre SP o funcion"); }

            }
            else { MessageBox.Show("Tipo de resultado no corresponde con metodo invocado"); }
        }
    }
}
