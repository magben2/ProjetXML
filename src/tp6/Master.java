//
// This file was generated by the JavaTM Architecture for XML Binding(JAXB) Reference Implementation, v2.2.4-2 
// See <a href="http://java.sun.com/xml/jaxb">http://java.sun.com/xml/jaxb</a> 
// Any modifications to this file will be lost upon recompilation of the source schema. 
// Generated on: 2016.02.02 at 05:47:33 PM CET 
//


package tp6;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "intervenant",
    "unite",
    "parcours"
})
@XmlRootElement(name = "master")
public class Master {

    @XmlElement(required = true)
    protected List<Intervenant> intervenant;
    @XmlElement(required = true)
    protected List<Unite> unite;
    @XmlElement(required = true)
    protected List<Parcours> parcours;

    /**
     * Gets the value of the intervenant property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the intervenant property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getIntervenant().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link Intervenant }
     * 
     * 
     */
    public List<Intervenant> getIntervenant() {
        if (intervenant == null) {
            intervenant = new ArrayList<Intervenant>();
        }
        return this.intervenant;
    }

    /**
     * Gets the value of the unite property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the unite property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getUnite().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link Unite }
     * 
     * 
     */
    public List<Unite> getUnite() {
        if (unite == null) {
            unite = new ArrayList<Unite>();
        }
        return this.unite;
    }

    /**
     * Gets the value of the parcours property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the parcours property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getParcours().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link Parcours }
     * 
     * 
     */
    public List<Parcours> getParcours() {
        if (parcours == null) {
            parcours = new ArrayList<Parcours>();
        }
        return this.parcours;
    }

}