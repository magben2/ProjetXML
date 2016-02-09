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
import javax.xml.bind.annotation.XmlID;
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
    "nbCredit",
    "resume",
    "plan",
    "lieu",
    "refIntervenant"
})
@XmlRootElement(name = "unite")
public class Unite {

    @XmlAttribute(name = "id", required = true)
    @XmlJavaTypeAdapter(CollapsedStringAdapter.class)
    @XmlID
    protected String id;
    @XmlElement(required = true)
    protected Nom nom;
    @XmlElement(required = true)
    protected String nbCredit;
    @XmlElement(required = true)
    protected String resume;
    @XmlElement(required = true)
    protected String plan;
    @XmlElement(required = true)
    protected String lieu;
    @XmlElement(name = "ref-intervenant", required = true)
    protected List<RefIntervenant> refIntervenant;

    /**
     * Gets the value of the id property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getId() {
        return id;
    }

    /**
     * Sets the value of the id property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setId(String value) {
        this.id = value;
    }

    /**
     * Gets the value of the nom property.
     * 
     * @return
     *     possible object is
     *     {@link Nom }
     *     
     */
    public Nom getNom() {
        return nom;
    }

    /**
     * Sets the value of the nom property.
     * 
     * @param value
     *     allowed object is
     *     {@link Nom }
     *     
     */
    public void setNom(Nom value) {
        this.nom = value;
    }

    /**
     * Gets the value of the nbCredit property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getNbCredit() {
        return nbCredit;
    }

    /**
     * Sets the value of the nbCredit property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setNbCredit(String value) {
        this.nbCredit = value;
    }

    /**
     * Gets the value of the resume property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getResume() {
        return resume;
    }

    /**
     * Sets the value of the resume property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setResume(String value) {
        this.resume = value;
    }

    /**
     * Gets the value of the plan property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getPlan() {
        return plan;
    }

    /**
     * Sets the value of the plan property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setPlan(String value) {
        this.plan = value;
    }

    /**
     * Gets the value of the lieu property.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getLieu() {
        return lieu;
    }

    /**
     * Sets the value of the lieu property.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setLieu(String value) {
        this.lieu = value;
    }

    /**
     * Gets the value of the refIntervenant property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the refIntervenant property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getRefIntervenant().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link RefIntervenant }
     * 
     * 
     */
    public List<RefIntervenant> getRefIntervenant() {
        if (refIntervenant == null) {
            refIntervenant = new ArrayList<RefIntervenant>();
        }
        return this.refIntervenant;
    }

}
