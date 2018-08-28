package com.atguigu.sssp.test;

import java.sql.SQLException;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.sql.DataSource;

import org.hibernate.jpa.QueryHints;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.atguigu.sssp.repository.DepartmentRepository;

public class SSSPTest {

    private ApplicationContext ctx = null;
    private DepartmentRepository departmentRepository;
    private EntityManagerFactory entityManagerFactory;

    {
        ctx = new ClassPathXmlApplicationContext("applicationContext.xml");
        departmentRepository = ctx.getBean(DepartmentRepository.class);
        entityManagerFactory = ctx.getBean(EntityManagerFactory.class);
    }

    @Test
    public void testJpaSecondLevelCache() {
        String jpql = "FROM Department d";
        EntityManager entityManager = entityManagerFactory.createEntityManager();
        Query query = entityManager.createQuery(jpql);
        query.setHint(QueryHints.HINT_CACHEABLE, true).getResultList();

        entityManager.close();

        entityManager = entityManagerFactory.createEntityManager();
        query = entityManager.createQuery(jpql);
        query.setHint(QueryHints.HINT_CACHEABLE, true).getResultList();
        entityManager.close();
    }

    @Test
    public void testRepositorySecondLevelCache() {
        departmentRepository.getAll();

        departmentRepository.getAll();
    }

    @Test
    public void testDataSource() throws SQLException {
        DataSource dataSource = ctx.getBean(DataSource.class);
        System.out.println(dataSource.getConnection());
    }

}
