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
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;
import javax.xml.bind.annotation.adapters.CollapsedStringAdapter;
import javax.xml.bind.annotation.adapters.XmlJavaTypeAdapter;


/**
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "nom",
    "refUnite"
})
@XmlRootElement(name = "bloc-unite")
public class BlocUnite {

    @XmlAttribute(name = "role", required = true)
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    protected String role;
    @XmlElement(required = true)
    protected List<Nom> nom;
    @XmlElement(name = "ref-unite", required = true)
    protected List<RefUnite> refUnite;

    /**
     * Gets the value of the role property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getRole() {
        return role;
    }

    /**
     * Sets the value of the role property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setRole(String value) {
        this.role = value;
    }

    /**
     * Gets the value of the nom property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the nom property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getNom().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link Nom }
     * 
     * 
     */
    public List<Nom> getNom() {
        if (nom == null) {
            nom = new ArrayList<Nom>();
        }
        return this.nom;
    }

    /**
     * Gets the value of the refUnite property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the refUnite property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getRefUnite().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link RefUnite }
     * 
     * 
     */
    public List<RefUnite> getRefUnite() {
        if (refUnite == null) {
            refUnite = new ArrayList<RefUnite>();
        }
        return this.refUnite;
    }

}
