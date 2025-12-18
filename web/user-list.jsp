<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<h2>User Management</h2>

<!-- SEARCH / FILTER -->
<form method="get">
    Username:
    <input type="text" name="keyword" value="${keyword}">

    Role:
    <select name="role">
        <option value="">All</option>
        <option value="ADMIN" ${role=='ADMIN'?'selected':''}>ADMIN</option>
        <option value="CUSTOMER" ${role=='CUSTOMER'?'selected':''}>CUSTOMER</option>
    </select>

    Status:
    <select name="status">
        <option value="">All</option>
        <option value="ACTIVE" ${status=='ACTIVE'?'selected':''}>ACTIVE</option>
        <option value="LOCKED" ${status=='LOCKED'?'selected':''}>LOCKED</option>
    </select>

    <button type="submit">Search</button>
</form>

<br>

<!-- USER TABLE -->
<table border="1" width="100%">
    <tr>
        <th>ID</th>
        <th>Username</th>
        <th>Full Name</th>
        <th>Email</th>
        <th>Role</th>
        <th>Status</th>
        <th>Action</th>
    </tr>

    <c:forEach items="${users}" var="u">
        <tr>
            <td>${u.userId}</td>
            <td>${u.username}</td>
            <td>${u.fullName}</td>
            <td>${u.email}</td>

            <!-- ROLE: CHỈ HIỂN THỊ -->
            <td>${u.role}</td>

            <td>${u.status}</td>

            <td>
                <!-- ===== ADMIN ===== -->
                <c:if test="${u.role == 'ADMIN'}">
                    <i style="color:gray">Protected</i>
                </c:if>

                <!-- ===== CUSTOMER ===== -->
                <c:if test="${u.role != 'ADMIN'}">

                    <!-- ❌ KHÔNG CHO ADMIN TỰ THAO TÁC CHÍNH MÌNH -->
                    <c:if test="${u.userId != sessionScope.currentUser.userId}">

                        <!-- LOCK / UNLOCK -->
                        <form method="post" style="display:inline">
                            <input type="hidden" name="userId" value="${u.userId}">
                            <input type="hidden" name="action"
                                   value="${u.status=='ACTIVE'?'lock':'unlock'}">
                            <button type="submit">
                                ${u.status=='ACTIVE'?'Lock':'Unlock'}
                            </button>
                        </form>

                        <!-- RESET PASSWORD -->
                        <form method="post" style="display:inline"
                              onsubmit="return confirm('Reset password for this user?')">
                            <input type="hidden" name="userId" value="${u.userId}">
                            <input type="hidden" name="action" value="resetPassword">
                            <button type="submit">Reset PW</button>
                        </form>

                        <!-- DELETE -->
                        <form method="post" style="display:inline"
                              onsubmit="return confirm('Delete this user?')">
                            <input type="hidden" name="userId" value="${u.userId}">
                            <input type="hidden" name="action" value="delete">
                            <button type="submit">Delete</button>
                        </form>

                    </c:if>

                    <!-- CHÍNH ADMIN -->
                    <c:if test="${u.userId == sessionScope.currentUser.userId}">
                        <i style="color:blue">(Current account)</i>
                    </c:if>

                </c:if>
            </td>
        </tr>
    </c:forEach>
</table>

<!-- PAGINATION -->
<br>
<c:forEach begin="1" end="${totalPages}" var="i">
    <a href="?page=${i}&keyword=${keyword}&role=${role}&status=${status}">
        [${i}]
    </a>
</c:forEach>
