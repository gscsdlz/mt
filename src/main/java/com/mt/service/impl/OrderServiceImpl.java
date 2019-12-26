package com.mt.service.impl;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.mt.dao.ItemDao;
import com.mt.dao.OrderDao;
import com.mt.entity.*;
import com.mt.enums.OrderUpdateOption;
import com.mt.enums.RemarkOrder;
import com.mt.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.*;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private ItemDao itemDao;

    @Override
    public List<Order> getOrderByUser(int accountId, int page, int size) {
        return orderDao.getAllOrderByUser(accountId, (page - 1) * size, size);
    }

    @Override
    public List<Order> getOrderByStore(int storeId, int page, int size) {
        return orderDao.getAllOrderByStore(storeId, (page - 1) * size, size);
    }

    @Override
    public List<Order> getOrder(int page, int size) {
        return orderDao.getAllOrder((page - 1) * size, size);
    }

    @Override
    public List<MiniItem> generateOrder(Order o) {
        List<Item> items = o.getItemList();
        List<MiniItem> newItems = new ArrayList<>();
        double totalPrice = 0;

        for (Item item : items) {
            MiniItem m = new MiniItem();
            Item tmp = itemDao.getItemById(item.getId());
            m.setId(item.getId());
            m.setTotal(item.getTotal());
            m.setPrice(tmp.getPrice());
            m.setItemName(tmp.getItemName());

            totalPrice += item.getTotal() * tmp.getPrice();
            newItems.add(m);
        }
        ObjectMapper mapper = new ObjectMapper();
        String itemStr = "";
        try {
            itemStr = mapper.writeValueAsString(newItems);
        } catch (Exception e) {
            e.printStackTrace();
        }
        o.setItems(itemStr);
        o.setTotalPrice(totalPrice);
        return newItems;
    }

    @Transactional
    @Override
    public boolean insertOrder(Order o, List<MiniItem> ids) {
        int row = orderDao.addOrder(o.getItems(), o.getAccountId(), o.getStoreId(), o.getTotalPrice());
        if (row > 0) {
            for (MiniItem item : ids) {
                Item i = itemDao.getItemById(item.getId());
                if (i.getInventory() < item.getTotal()) {
                    throw new RuntimeException(item.getItemName() + " 库存不足");
                }
                int effRow1 = itemDao.decreaseInventory(item.getId(), item.getTotal());
                int effRow2 = itemDao.increaseTotalSale(item.getId(), item.getTotal());

                if (effRow1 <= 0 || effRow2 <= 0) {
                    throw new RuntimeException("系统错误，请重试");
                }
            }
        } else {
            throw new RuntimeException("系统错误，请重试");
        }
        return true;
    }

    @Override
    public boolean updateOrder(Order o, OrderUpdateOption updateOption) {
        if (updateOption == OrderUpdateOption.UPDATE_COMMIT_ONLY) {
            return orderDao.updateOrderRemark(o.getId(), o.getRemark()) > 0;
        } else if (updateOption == OrderUpdateOption.UPDATE_STAR_ONLY) {
            return orderDao.updateOrderStar(o.getId(), o.getStar()) > 0;
        } else {
            return orderDao.updateOrderStatus(o.getId(), o.getOrderStatus()) > 0;
        }
    }

    @Override
    public List<Order> getHistoryOrder(int page, int size) {
        return orderDao.getHistoryOrder((page - 1) * size, size);
    }

    @Override
    public boolean delOrder(int id) {
        return orderDao.delOrder(id) > 0;
    }

    @Override
    public StoreStar getStoreStar(int storeId) {
        return orderDao.getStoreStar(storeId);
    }

    @Override
    public List<UserRemark> getRemark(int storeId, int page, int size, RemarkOrder orderBy) {
        if (orderBy == RemarkOrder.ORDER_BY_DATE) {
            return orderDao.getRemarkOrderByDate(storeId, (page - 1) * size, size);
        } else {
            return orderDao.getRemarkOrderByStar(storeId, (page - 1) * size, size);
        }
    }

    @Override
    public Map<String, Integer> getRemarkInfo(int storeId) {
        List<Integer> stars = orderDao.getRemarkInfo(storeId);
        Map<String, Integer> res = new HashMap<>();

        int r1 = 0, r2 = 0, r3 = 0;
        for (Integer s : stars) {
            if (s >= 8) {
                r1++;
            } else if (s > 4) {
                r2++;
            } else if (s > 0) {
                r3++;
            }
        }
        res.put("total", r1 + r2 + r3);
        res.put("r1", r1);
        res.put("r2", r2);
        res.put("r3", r3);
        return res;
    }

    @Override
    public int countOrder() {
        return orderDao.countOrder();
    }

    @Override
    public int countUnOrder() {
        return orderDao.countUnOrder();
    }

    @Override
    public List<String> groupByMonth(String lastTime) {
        return orderDao.getOrderCreatedAt(lastTime + " 00:00:00");
    }
}
