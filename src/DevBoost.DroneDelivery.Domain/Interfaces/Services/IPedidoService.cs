﻿using DevBoost.DroneDelivery.Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace DevBoost.DroneDelivery.Domain.Interfaces.Services
{
    public interface IPedidoService
    {
        Task<IList<Pedido>> GetAll();
        Task<Pedido> GetById(Guid id);
        Task<bool> Insert(Pedido pedido);
        Task<Pedido> Update(Pedido pedido);
        string IsPedidoValido(Pedido pedido);
        Task DespacharPedidos();
        Task<IList<Pedido>> GetPedidosEmTransito();
    }
}
