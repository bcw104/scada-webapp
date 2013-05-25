package com.ht.scada.web.entity;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.springframework.data.jpa.domain.AbstractPersistable;

import javax.persistence.*;

@Entity
@Table(name="T_MenuItem")
public class MenuItem extends AbstractPersistable<Integer> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5473548079509300042L;


	@Column(nullable=false)
	private String menuItemName;
	
	@Column(nullable=false)
	private String menuItemUrl;
	
	@Column(nullable=false)
	private String pname;

    public String getPname() {
        return pname;
    }

    public void setPname(String pname) {
        this.pname = pname;
    }
	
	
	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="type_id")
    @JsonIgnore
	private MenuType menuType;

	public String getMenuItemName() {
		return menuItemName;
	}

	public void setMenuItemName(String menuItemName) {
		this.menuItemName = menuItemName;
	}

	public String getMenuItemUrl() {
		return menuItemUrl;
	}

	public void setMenuItemUrl(String menuItemUrl) {
		this.menuItemUrl = menuItemUrl;
	}

	public MenuType getMenuType() {
		return menuType;
	}

	public void setMenuType(MenuType menuType) {
		this.menuType = menuType;
	}
	
	

}
