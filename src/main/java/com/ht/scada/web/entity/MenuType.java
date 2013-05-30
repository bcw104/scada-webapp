package com.ht.scada.web.entity;

import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Index;
import org.springframework.data.jpa.domain.AbstractPersistable;

@Entity
@Table(name = "T_MenuType")
public class MenuType extends AbstractPersistable<Integer> {

    /**
     *
     */
    private static final long serialVersionUID = 8285880401907156684L;
    @Column(nullable = false, unique = true)
    private String menuTypeName;
    @OneToMany(mappedBy="menuType")
    private List<MenuItem> menuItems;

    public String getMenuTypeName() {
        return menuTypeName;
    }

    public void setMenuTypeName(String menuTypeName) {
        this.menuTypeName = menuTypeName;
    }

    public List<MenuItem> getMenuItems() {
        return menuItems;
    }

    public void setMenuItems(List<MenuItem> menuItems) {
        this.menuItems = menuItems;
    }
}
