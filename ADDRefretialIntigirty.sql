-- 1. cash_registers
ALTER TABLE cash_registers
    DROP CONSTRAINT IF EXISTS FK_cash_registers_branches,
    ADD CONSTRAINT FK_cash_registers_branches
        FOREIGN KEY (branch_id) REFERENCES branches(branch_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- 2. warehouses
ALTER TABLE warehouses
    DROP CONSTRAINT IF EXISTS FK_warehouses_branches,
    ADD CONSTRAINT FK_warehouses_branches
        FOREIGN KEY (branch_id) REFERENCES branches(branch_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- 3. employees
ALTER TABLE employees
    DROP CONSTRAINT IF EXISTS FK_employees_branches,
    DROP CONSTRAINT IF EXISTS FK_employees_roles,
    ADD CONSTRAINT FK_employees_branches
        FOREIGN KEY (branch_id) REFERENCES branches(branch_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK_employees_roles
        FOREIGN KEY (role_id) REFERENCES roles(role_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- 4. expenses
ALTER TABLE expenses
    DROP CONSTRAINT IF EXISTS FK_expenses_branches,
    DROP CONSTRAINT IF EXISTS FK_expenses_cash_registers,
    DROP CONSTRAINT IF EXISTS FK_expenses_employees,
    ADD CONSTRAINT FK_expenses_branches
        FOREIGN KEY (branch_id) REFERENCES branches(branch_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK_expenses_cash_registers
        FOREIGN KEY (cash_register_id) REFERENCES cash_registers(cash_register_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK_expenses_employees
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- 5. inventory
ALTER TABLE inventory
    DROP CONSTRAINT IF EXISTS FK_inventory_warehouses,
    DROP CONSTRAINT IF EXISTS FK_inventory_products,
    ADD CONSTRAINT FK_inventory_warehouses
        FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK_inventory_products
        FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- 6. inventory_transactions
ALTER TABLE inventory_transactions
    DROP CONSTRAINT IF EXISTS FK_inventory_transactions_warehouses,
    DROP CONSTRAINT IF EXISTS FK_inventory_transactions_products,
    DROP CONSTRAINT IF EXISTS FK_inventory_transactions_employees,
    ADD CONSTRAINT FK_inventory_transactions_warehouses
        FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK_inventory_transactions_products
        FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK_inventory_transactions_employees
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- 7. purchases
ALTER TABLE purchases
    DROP CONSTRAINT IF EXISTS FK_purchases_suppliers,
    DROP CONSTRAINT IF EXISTS FK_purchases_warehouses,
    DROP CONSTRAINT IF EXISTS FK_purchases_employees,
    ADD CONSTRAINT FK_purchases_suppliers
        FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK_purchases_warehouses
        FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK_purchases_employees
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- 8. sales
ALTER TABLE sales
    DROP CONSTRAINT IF EXISTS FK_sales_branches,
    DROP CONSTRAINT IF EXISTS FK_sales_employees,
    DROP CONSTRAINT IF EXISTS FK_sales_customers,
    DROP CONSTRAINT IF EXISTS FK_sales_cash_registers,
    ADD CONSTRAINT FK_sales_branches
        FOREIGN KEY (branch_id) REFERENCES branches(branch_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK_sales_employees
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK_sales_customers
        FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK_sales_cash_registers
        FOREIGN KEY (cash_register_id) REFERENCES cash_registers(cash_register_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- 9. sale_items
ALTER TABLE sale_items
    DROP CONSTRAINT IF EXISTS FK_sale_items_sales,
    DROP CONSTRAINT IF EXISTS FK_sale_items_products,
    ADD CONSTRAINT FK_sale_items_sales
        FOREIGN KEY (sale_id) REFERENCES sales(sale_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK_sale_items_products
        FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- 10. returns
ALTER TABLE returns
    DROP CONSTRAINT IF EXISTS FK_returns_sales,
    DROP CONSTRAINT IF EXISTS FK_returns_employees,
    ADD CONSTRAINT FK_returns_sales
        FOREIGN KEY (sale_id) REFERENCES sales(sale_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK_returns_employees
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- 11. return_items
ALTER TABLE return_items
    DROP CONSTRAINT IF EXISTS FK_return_items_returns,
    DROP CONSTRAINT IF EXISTS FK_return_items_sale_items,
    ADD CONSTRAINT FK_return_items_returns
        FOREIGN KEY (return_id) REFERENCES returns(return_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK_return_items_sale_items
        FOREIGN KEY (sale_item_id) REFERENCES sale_items(sale_item_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- 12. cash_transactions
ALTER TABLE cash_transactions
    DROP CONSTRAINT IF EXISTS FK_cash_transactions_cash_registers,
    DROP CONSTRAINT IF EXISTS FK_cash_transactions_employees,
    ADD CONSTRAINT FK_cash_transactions_cash_registers
        FOREIGN KEY (cash_register_id) REFERENCES cash_registers(cash_register_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK_cash_transactions_employees
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- 13. stock_transfers
ALTER TABLE stock_transfers
    DROP CONSTRAINT IF EXISTS FK_stock_transfers_from_warehouse,
    DROP CONSTRAINT IF EXISTS FK_stock_transfers_to_warehouse,
    DROP CONSTRAINT IF EXISTS FK_stock_transfers_employees,
    ADD CONSTRAINT FK_stock_transfers_from_warehouse
        FOREIGN KEY (from_warehouse_id) REFERENCES warehouses(warehouse_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK_stock_transfers_to_warehouse
        FOREIGN KEY (to_warehouse_id) REFERENCES warehouses(warehouse_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK_stock_transfers_employees
        FOREIGN KEY (employee_id) REFERENCES employees(employee_id) ON DELETE CASCADE ON UPDATE CASCADE;

-- 14. stock_transfer_items
ALTER TABLE stock_transfer_items
    DROP CONSTRAINT IF EXISTS FK_stock_transfer_items_transfers,
    DROP CONSTRAINT IF EXISTS FK_stock_transfer_items_products,
    ADD CONSTRAINT FK_stock_transfer_items_transfers
        FOREIGN KEY (stock_transfer_id) REFERENCES stock_transfers(stock_transfer_id) ON DELETE CASCADE ON UPDATE CASCADE,
    ADD CONSTRAINT FK_stock_transfer_items_products
        FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE ON UPDATE CASCADE;