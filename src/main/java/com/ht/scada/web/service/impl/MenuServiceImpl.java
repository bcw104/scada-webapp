package com.ht.scada.web.service.impl;

import com.ht.scada.web.dao.MenuItemDao;
import com.ht.scada.web.dao.MenuTypeDao;
import com.ht.scada.web.entity.MenuItem;
import com.ht.scada.web.entity.MenuType;
import com.ht.scada.web.service.MenuService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.inject.Inject;
import java.util.List;

@Transactional
@Service("menuService")
public class MenuServiceImpl implements MenuService {

    @Inject
    private MenuItemDao menuItemDao;
    @Inject
    private MenuTypeDao menuTypeDao;

    @Override
    public List<MenuType> getAllMenuTypes() {
        return menuTypeDao.findAll();
    }

    @Override
    public List<MenuItem> getAllMenuItem() {
        return menuItemDao.findAll();
    }
    @Override
    public void insertMenuItem(MenuItem item){
        menuItemDao.save(item);
    }
    @Override
    public void insertMenuType(MenuType menuType){
        menuTypeDao.save(menuType);
    }
    
}
