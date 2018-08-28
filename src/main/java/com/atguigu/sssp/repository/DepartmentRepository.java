package com.atguigu.sssp.repository;

import java.util.List;

import javax.persistence.QueryHint;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.QueryHints;

import com.atguigu.sssp.entity.Department;

public interface DepartmentRepository extends JpaRepository<Department, Integer> {

    @QueryHints({@QueryHint(name = "org.hibernate.cacheable", value = "true")})
    @Query("FROM Department d")
    List<Department> getAll();

}
